#!/bin/bash
# finds root directories of git repos that contain uncommitted changes.
# Recurses through all directories from current working directory.
#
# Loop File Names With Spaces
# @see http://www.cyberciti.biz/tips/handling-filenames-with-spaces-in-bash.html
CWD=`pwd`
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
find . -type d -name '.git' | while read f
do
    DIR=`dirname $f`
    cd $DIR
    GDO=`git gc`
    echo $DIR
    cd $CWD
done
IFS=$SAVEIFS
