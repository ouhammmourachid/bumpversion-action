#!/bin/sh -l

echo "start bumpversion exec"
bumpversion $1
new_version=$(git describe --tags --abbrev=0)
echo "new_version=$new_version" >> $GITHUB_OUTPUT

