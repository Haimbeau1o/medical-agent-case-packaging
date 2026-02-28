#!/usr/bin/env bash
set -euo pipefail

OWNER="${1:-@me}"
TITLE="${2:-Medical Agent Packaging Board}"

echo "Creating project for owner: ${OWNER}"
PROJECT_JSON="$(gh project create --owner "${OWNER}" --title "${TITLE}" --format json)"
PROJECT_NUMBER="$(echo "${PROJECT_JSON}" | python3 -c 'import json,sys; print(json.load(sys.stdin)["number"])')"

echo "Project created: ${PROJECT_NUMBER}"
echo "Current fields:"
gh project field-list "${PROJECT_NUMBER}" --owner "${OWNER}"

echo
echo "Next step (manual in UI): set Status options to:"
echo "Backlog, Ready, In Progress, Review, Done"
echo
echo "You can open the board with:"
echo "gh project view ${PROJECT_NUMBER} --owner ${OWNER} --web"
