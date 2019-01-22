#!/bin/bash
set -euo pipefail

branchname=${1:-}

git branch -d "$branchname"
git push origin :"$branchname"
