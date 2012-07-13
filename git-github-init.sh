#!/bin/sh
if [ -z "$1" -o -z "$2" ]; then
    echo "Usage: $0 user_name repository_name\n"
    exit
fi

URL=git@github.com:$1/$2.git

git init
git add .
git commit -m 'first commit'
git remote add origin $URL
git push -u origin master

echo "Pushed to $URL\n"
