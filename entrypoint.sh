#!/bin/sh -l

echo "Hello $1"
echo "bump verion of file test.py"
bumpversion patch
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT

