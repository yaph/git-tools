#!/bin/sh
GITREPOS=$HOME'/repos/remotes'
PROJECTDIR=`pwd`
PROJECT=`basename $PROJECTDIR`
PROJECTREPO=$GITREPOS/$PROJECT.git

echo "Init git in project dir $PROJECTDIR"
git init
git add .
git commit -m "first commit"

echo "Create git repository for project in $PROJECTREPO"
mkdir "$PROJECTREPO"
cd "$PROJECTREPO"
git init --bare

echo "Push to project repository"
cd "$PROJECTDIR"
git remote add origin "$PROJECTREPO"
git push origin master
