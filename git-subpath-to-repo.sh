#!/bin/sh
if [ -z "$1" -o -z "$2" -o -z "$3"]; then
    echo "Usage: $0 user_name repository_name directory_name\n"
    exit
fi

URL=git@github.com:$1/$2.git

echo $URL

git clone git://github.com/$1/$2.git

cd $2

git filter-branch --prune-empty --subdirectory-filter $3 master

