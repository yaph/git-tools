#!/bin/bash
set -euo pipefail

branchname=${1}

git checkout master
git pull origin master
git merge "$branchname"
git push origin master
