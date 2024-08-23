# bumpversion-action

> [!WARNING]
> This action is still semi-experimental.
> I’m happy to [hear feedback](https://github.com/ouhammmourachid/bumpversion-action/issues), though!

## Description

The `bumpversion-action` is a GitHub Actions workflow that automates the process of bumping the version of a project. It allows you to easily increment the version number based on the specified bump type (major, minor, or patch) and push the changes to a specified branch.

## Inputs

- `bump-type` (required): The type of the bump version. Valid options are 'major', 'minor', or 'patch'.
- `branch` (required): The branch to push the changes to. Default is 'main'.
- `github-token` (required): The GitHub token used for authentication. This should be a secret. Default is `GITHUB_TOKEN`.
- `release-title` (not required): A title to be the base for the realase like `Release v2.3` etc default value is `''`.
- `generate-notes` (not required): true if you want to generate notes automatically , false other wise default value is `true`.


## Outputs

- `new_version`: The new version after the bump version.
- `old_version`: The old version before the bump version.

## Usage
create a `bumpver.toml` or `.bumpver.toml` file in your project dir similar the one used in `bumpver` library like this one .

```toml
[bumpver]
current_version = "0.1.0"
version_pattern = "MAJOR.MINOR.PATCH"

# pattern of files in which version is mentioned.
[bumpver.file_patterns]
"pyproject.toml" = [
    'version = "{version}"$',
]
```

then create a workflow file in `.github/workflows` dir like this one

```yml
name: test bumpversion-action

on:
  workflow_dispatch:
    inputs:
      bump-type:
        description: 'Bump type'
        required: true
        options:
          - major
          - minor
          - patch
        default: 'patch'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v4
      with:
        persist-credentials: false # otherwise, the token used is the GITHUB_TOKEN, instead of your personal token
        fetch-depth: 0             # otherwise, you will fail to push refs to dest repo
    - name: bumpversion
      uses: ouhammmourachid/bumpversion-action@v1.1.0
      with:
        github-token: ${{ secrets.TOKEN_PAT }}
        bump-type: ${{ github.event.inputs.bump-type }}
```
