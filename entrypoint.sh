#!/bin/sh -l

echo "start bumpver exec"

echo $2

old_version=$(bumpver show | awk '/Current Version:/{print $3}')

echo "old_version=$old_version" >> $GITHUB_OUTPUT

bumpver update --$1

# set up ssh key for git

mkdir -p ~/.ssh
echo "$2" > ~/.ssh/id_rsa


git config --global user.email "actions@github.com"
git config --global user.name "github-actions[bot]"
git config --global --add safe.directory /github/workspace
git add .


new_version=$(bumpver show | awk '/Current Version:/{print $3}')

git commit -m "Bump version $old_version to $new_version"
git push git@github.com:$GITHUB_REPOSITORY.git HEAD:$GITHUB_REF


echo $new_version
echo "new_version=$new_version" >> $GITHUB_OUTPUT

