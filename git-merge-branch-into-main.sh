#!/bin/bash
set -euo pipefail

branchname=${1}

git checkout main
git pull origin main
git merge "$branchname"
git push origin main
