#!/bin/sh
# see http://nvie.com/posts/a-successful-git-branching-model/
git checkout master
git merge --no-ff develop
git push
