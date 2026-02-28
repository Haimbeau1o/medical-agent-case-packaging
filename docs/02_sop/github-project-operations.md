# GitHub Project Operations

## Objective
Keep workstream execution visible with a single project board and standardized status values.

## Prerequisite
`gh` token must include `project` and `read:project` scopes:

```bash
gh auth refresh -s project,read:project
```

## Create Project Board
```bash
cd /Volumes/passport/project/openclaw_work/resume/medical-agent-case-packaging
./tools/bootstrap_project_board.sh Haimbeau1o "Medical Agent Packaging Board" Haimbeau1o/medical-agent-case-packaging
```

## Expected Board Setup
- Project title: `Medical Agent Packaging Board`
- Workflow options:
  - `Backlog`
  - `Ready`
  - `In Progress`
  - `Review`
  - `Done`
- Auto-sync rules:
  - all open issues from `medical-agent-case-packaging` are added to board
  - issues with `priority:P0` are set to `Ready`
  - all other issues are set to `Backlog`

## Link Work Items
Manual fallback (if needed):

```bash
gh project item-add <PROJECT_NUMBER> --owner Haimbeau1o --url https://github.com/Haimbeau1o/medical-agent-case-packaging/issues/1
```

## Governance Rules
1. Every issue must have exactly one workstream label.
2. Every issue must map to one milestone.
3. Every in-progress item must have an owner and ETA in issue comment.
4. Any blocked item must include unblock condition in latest comment.
