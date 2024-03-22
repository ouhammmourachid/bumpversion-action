#!/bin/sh -l

echo "start bumpver exec"


old_version=$(bumpver show | awk '/Current Version:/{print $3}')

echo "old_version=$old_version" >> $GITHUB_OUTPUT

bumpver update --$1

# set up ssh key for git

mkdir -p ~/.ssh
echo "$1" > ~/.ssh/id_rsa


git config --global user.email "actions@github.com"
git config --global user.name "github-actions[bot]"
git add .


new_version=$(bumpver show | awk '/Current Version:/{print $3}')

git commit -m "Bump version $old_version to $new_version"



echo $new_version
echo "new_version=$new_version" >> $GITHUB_OUTPUT

