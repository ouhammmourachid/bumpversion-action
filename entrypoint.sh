#!/bin/sh -l

echo "start bumpversion exec"
bumpversion $1
new_version=$(git describe --tags --abbrev=0)
echo "new-version=$new_version" >> $GITHUB_OUTPUT

