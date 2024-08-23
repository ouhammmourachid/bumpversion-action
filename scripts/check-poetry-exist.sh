#!/bin/bash

if [ -f pyproject.toml ]; then

    echo "poetry file exists"
    echo "poetry_exist=true" >> $GITHUB_ENV
    python_version=$(grep 'python = ' pyproject.toml | cut -d '"' -f 2)
    echo "Python version: $python_version"
    echo "python_version=$python_version" >> $GITHUB_ENV

else
    echo "poetry file does not exist"
    echo "poetry_exist=false" >> $GITHUB_ENV
    echo "Python version: 3.12"
     echo "python_version=3.12" >> $GITHUB_ENV
fi
