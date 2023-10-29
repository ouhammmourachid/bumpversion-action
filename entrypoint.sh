#!/bin/sh -l

echo "start bumpversion exec"
bumpversion $1

git config --global user.email "bumpversion@github-actions"
git config --global user.name "BumpVersion Action"

new_version=$(git describe --tags --abbrev=0)
echo $new_version
echo "new_version=$new_version" >> $GITHUB_OUTPUT

