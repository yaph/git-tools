#!/bin/sh
if [ ! $1 ]; then
    echo "Usage: $0 repository_name\n"
    exit
fi

URL=git@github.com:yaph/$1.git

git init
git add .
git commit -m 'first commit'
git remote add origin $URL
git push -u origin master

echo "Pushed to $URL\n"
