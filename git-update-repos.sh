#!/bin/bash
# Update (pull and push) all Git repositories found in the current directory and its subdirectories.
set -euo pipefail

# Find all .git directories in the current directory and subdirectories
git_dirs=$(find "$(pwd)" -name .git -type d)

# Iterate through each .git directory and update the corresponding repository
for git_dir in $git_dirs; do
    repo_dir=$(dirname "$git_dir")

    # Check if the directory is a valid Git repository (not a submodule)
    if [ -d "$repo_dir/.git" ]; then
        echo "Updating Git repository in $repo_dir"
        cd "$repo_dir" || continue
        git pull
        git push
    else
        echo "Skipping $repo_dir - not a Git repository"
    fi
done
