#!/bin/sh
# from https://github.com/luanmuniz/git-tools/blob/master/git-nicelog.sh
git log --pretty="%C(magenta)%h %C(yellow)%ad %C(white)| %C(green)%s%C(red)%d %C(yellow)[%an]" --graph --date-order --date=short --max-count=15
