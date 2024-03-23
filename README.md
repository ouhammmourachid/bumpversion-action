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
create a `pyproject.toml` file in your project dir similar the one used in `bumpver` library like this one .
```toml
[tool.poetry]
name = "pyxo"
version = "0.1.0"
description = ""
authors = [""]
license = "MIT"
readme = "README.md"

[bumpver]
current_version = "0.1.0"
version_pattern = "MAJOR.MINOR.PATCH"

[bumpver.file_patterns]
"pyproject.toml" = [
    'version = "{version}"$',
]

...

[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"
```

create a workflow for new workflow

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
