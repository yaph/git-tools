#!/bin/bash
# Initialize a git repository from the current working directory.
# If called a with an argument it will be used as the repo name.
set -euo pipefail

DIR=`pwd`
PROJECT=${1:-`basename $DIR`}
REPO=$GITREMOTES/$PROJECT.git

echo "Init git in project dir $DIR"
git init
git add .
git commit -m "first commit"

echo "Create git repository for project in $REPO"
mkdir "$REPO"
cd "$REPO"
git init --bare

echo "Push to project repository"
cd "$DIR"
git remote add origin "$REPO"
git push origin main
