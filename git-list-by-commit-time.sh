#!/bin/bash
# This script uses the find command to locate Git repositories and the git log command to get the last commit date.
# It then creates an associative array to store repository paths and last commit dates, sorts and prints them by commit date.

# Function to get the last commit date of a Git repository
get_last_commit_date() {
    cd "$1" || return
    last_commit_date=$(git log -1 --format="%cd" --date=format:"%Y-%m-%d %H:%M:%S" 2>/dev/null)
    cd - >/dev/null || return
    echo "$last_commit_date"
}

# Find all Git repositories and store them in an array
repos=($(find . -type d -name ".git"))

# Check if there are any Git repositories
if [ ${#repos[@]} -eq 0 ]; then
    echo "No Git repositories found."
    exit 1
fi

# Create an associative array to store repositories and their last commit dates
declare -A repo_dates

# Populate the associative array with repository paths and last commit dates
for repo in "${repos[@]}"; do
    repo_path=$(dirname "$repo")
    last_commit_date=$(get_last_commit_date "$repo_path")
    repo_dates["$repo_path"]=$last_commit_date
done

# Print the repositories sorted by the last commit date
for repo_path in "${!repo_dates[@]}"; do
    echo "$repo_path ${repo_dates[$repo_path]}"
done | sort -k2,2r
