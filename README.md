# bumpversion-action

## Description

The `bumpversion-action` is a GitHub Actions workflow that automates the process of bumping the version of a project. It allows you to easily increment the version number based on the specified bump type (major, minor, or patch) and push the changes to a specified branch.

## Inputs

- `bump-type` (required): The type of the bump version. Valid options are 'major', 'minor', or 'patch'.
- `ssh-private-key` (required): The SSH private key to use for the git push.
- `branch` (required): The branch to push the changes to. Default is 'main'.
- `github-token` (required): The GitHub token used for authentication. This should be a secret.

## Outputs

- `new_version`: The new version after the bump version.
- `old_version`: The old version before the bump version.

## Usage
```yml
on:
    push:
        branches:
            - main

jobs:
    bumpversion:
        runs-on: ubuntu-latest
        steps:
            - name: Checkout repository
              uses: actions/checkout@v2
            - name: bumpversion
              uses: ouhammmourachid@bumpversion-action@v1
              with:
                    bump-type: 'patch'
                    ssh-private-key: ${{ secrets.SSH_PRIVATE_KEY }}
                    github-token: ${{ secrets.GITHUB_TOKEN }}
```