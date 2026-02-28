#!/usr/bin/env bash
set -euo pipefail

OWNER="${1:-@me}"
TITLE="${2:-Medical Agent Packaging Board}"
REPO="${3:-Haimbeau1o/medical-agent-case-packaging}"
WORKFLOW_FIELD_NAME="Workflow"
WORKFLOW_OPTIONS="Backlog,Ready,In Progress,Review,Done"

project_lookup="$(gh project list --owner "${OWNER}" --format json)"
project_info="$(
  PROJECT_LOOKUP="${project_lookup}" TITLE_ENV="${TITLE}" python3 - <<'PY'
import json
import os

title = os.environ["TITLE_ENV"]
data = json.loads(os.environ["PROJECT_LOOKUP"])
for p in data.get("projects", []):
    if p.get("title") == title and p.get("closed") is False:
        print(f'{p["number"]}|{p["id"]}|{str(p.get("public", False)).lower()}')
        break
PY
)"

if [ -z "${project_info}" ]; then
  echo "Creating project for owner: ${OWNER}"
  created="$(gh project create --owner "${OWNER}" --title "${TITLE}" --format json)"
  PROJECT_NUMBER="$(printf '%s' "${created}" | python3 -c 'import json,sys; print(json.load(sys.stdin)["number"])')"
  PROJECT_ID="$(printf '%s' "${created}" | python3 -c 'import json,sys; print(json.load(sys.stdin)["id"])')"
  PROJECT_PUBLIC="false"
  echo "Project created: ${PROJECT_NUMBER}"
else
  PROJECT_NUMBER="$(printf '%s' "${project_info}" | cut -d'|' -f1)"
  PROJECT_ID="$(printf '%s' "${project_info}" | cut -d'|' -f2)"
  PROJECT_PUBLIC="$(printf '%s' "${project_info}" | cut -d'|' -f3)"
  echo "Reusing existing project: ${PROJECT_NUMBER}"
fi

if [ "${PROJECT_PUBLIC}" != "true" ]; then
  gh project edit "${PROJECT_NUMBER}" --owner "${OWNER}" --visibility PUBLIC >/dev/null
fi

gh project link "${PROJECT_NUMBER}" --owner "${OWNER}" --repo "${REPO}" >/dev/null || true

fields_json="$(gh project field-list "${PROJECT_NUMBER}" --owner "${OWNER}" --format json)"
workflow_field_id="$(
  FIELDS_JSON="${fields_json}" FIELD_NAME="${WORKFLOW_FIELD_NAME}" python3 - <<'PY'
import json
import os

name = os.environ["FIELD_NAME"]
data = json.loads(os.environ["FIELDS_JSON"])
for field in data.get("fields", []):
    if field.get("name") == name:
        print(field["id"])
        break
PY
)"

if [ -z "${workflow_field_id}" ]; then
  echo "Creating workflow field with options: ${WORKFLOW_OPTIONS}"
  gh project field-create "${PROJECT_NUMBER}" \
    --owner "${OWNER}" \
    --name "${WORKFLOW_FIELD_NAME}" \
    --data-type SINGLE_SELECT \
    --single-select-options "${WORKFLOW_OPTIONS}" >/dev/null
  fields_json="$(gh project field-list "${PROJECT_NUMBER}" --owner "${OWNER}" --format json)"
fi

workflow_info="$(
  FIELDS_JSON="${fields_json}" FIELD_NAME="${WORKFLOW_FIELD_NAME}" python3 - <<'PY'
import json
import os

name = os.environ["FIELD_NAME"]
data = json.loads(os.environ["FIELDS_JSON"])
for field in data.get("fields", []):
    if field.get("name") == name:
        options = {opt["name"]: opt["id"] for opt in field.get("options", [])}
        print(f'{field["id"]}|{options.get("Backlog","")}|{options.get("Ready","")}')
        break
PY
)"

WORKFLOW_FIELD_ID="$(printf '%s' "${workflow_info}" | cut -d'|' -f1)"
BACKLOG_ID="$(printf '%s' "${workflow_info}" | cut -d'|' -f2)"
READY_ID="$(printf '%s' "${workflow_info}" | cut -d'|' -f3)"

if [ -z "${WORKFLOW_FIELD_ID}" ] || [ -z "${BACKLOG_ID}" ] || [ -z "${READY_ID}" ]; then
  echo "Failed to resolve workflow field or option IDs."
  exit 1
fi

issue_lines="$(gh issue list --repo "${REPO}" --limit 100 --json number,url,labels --jq '.[] | "\(.number)|\(.url)|\([.labels[].name]|join(","))"')"
existing_urls="$(gh project item-list "${PROJECT_NUMBER}" --owner "${OWNER}" --format json --jq '.items[].content.url')"

echo "Syncing issues into project ${PROJECT_NUMBER}..."
while IFS='|' read -r number url labels; do
  [ -z "${number}" ] && continue
  item_id=""
  if printf '%s\n' "${existing_urls}" | grep -Fxq "${url}"; then
    item_id="$(gh project item-list "${PROJECT_NUMBER}" --owner "${OWNER}" --format json --jq ".items[] | select(.content.url==\"${url}\") | .id")"
  else
    item_id="$(gh project item-add "${PROJECT_NUMBER}" --owner "${OWNER}" --url "${url}" --format json --jq '.id')"
    existing_urls="${existing_urls}"$'\n'"${url}"
  fi

  stage_id="${BACKLOG_ID}"
  stage_name="Backlog"
  if printf '%s' "${labels}" | grep -q 'priority:P0'; then
    stage_id="${READY_ID}"
    stage_name="Ready"
  fi

  gh project item-edit \
    --id "${item_id}" \
    --project-id "${PROJECT_ID}" \
    --field-id "${WORKFLOW_FIELD_ID}" \
    --single-select-option-id "${stage_id}" >/dev/null

  echo "  - issue #${number} -> ${stage_name}"
done <<< "${issue_lines}"

echo
echo "Done."
echo "Project URL:"
gh project view "${PROJECT_NUMBER}" --owner "${OWNER}" --format json --jq '.url'
echo "Open in browser:"
echo "gh project view ${PROJECT_NUMBER} --owner ${OWNER} --web"
