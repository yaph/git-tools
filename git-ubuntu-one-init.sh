#!/bin/sh
# Using Ubuntu One for git repositories based on
# http://stackoverflow.com/questions/1960799/using-gitdropbox-together-effectively
#
# Create a symbolic link to this script in a directory that is in your $PATH, e.g.:
# ln -s /path/to/script $HOME/bin
#
# Execute the script in the directory you want to track with git.

# variables
GITREPOS=$HOME'/Ubuntu One/repos'
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
