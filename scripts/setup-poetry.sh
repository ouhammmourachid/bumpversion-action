#!/bin/bash
poetry init --no-interaction
# detect if the witch file of bumpver.toml or .bumpver.toml

if [ -f bumpver.toml ]; then

  echo "bumpver.toml file exists"
  bumpver_file=bumpver.toml

else

  echo ".bumpver.toml file exists"
  bumpver_file=.bumpver.toml

fi

# set the current version to the version in bumpver.toml or .bumpver.toml
current_version=$(grep 'current_version' $bumpver_file | cut -d '"' -f 2)
echo "Current version: $current_version"
sed -i "s/version = \"0.1.0\"/version = \"$current_version\"/" pyproject.toml
