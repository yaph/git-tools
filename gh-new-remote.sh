#!/bin/sh
if [ -z "$1" -o -z "$2" ]; then
    echo "Usage: $0 user_name new_repository_name\n"
    exit
fi

URL=https://github.com/$1/$2.git

echo $URL

git remote set-url origin $URL
