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
./tools/bootstrap_project_board.sh Haimbeau1o
```

## Expected Board Setup
- Project title: `Medical Agent Packaging Board`
- Status options:
  - `Backlog`
  - `Ready`
  - `In Progress`
  - `Review`
  - `Done`

## Link Work Items
After issue creation, add each issue to the project and assign status:

```bash
gh project item-add <PROJECT_NUMBER> --owner Haimbeau1o --url https://github.com/Haimbeau1o/medical-agent-case-packaging/issues/1
```

## Governance Rules
1. Every issue must have exactly one workstream label.
2. Every issue must map to one milestone.
3. Every in-progress item must have an owner and ETA in issue comment.
4. Any blocked item must include unblock condition in latest comment.
