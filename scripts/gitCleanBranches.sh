#!/usr/bin/env bash
set -euo pipefail

IGNORE_BRANCHES=("master" "develop" "main" "dev")

Color_Off='\033[0m'       # Text Reset
Green='\033[0;32m'        # Green

echo "Current branches:"
echo

git branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate
echo

current_branch=$(git branch --show-current)

function should_ignore(){
    local branch="$1"
    # always ignore current_branch
    [[ "$branch" == "$current_branch" ]] && return 0

    for pattern in "${IGNORE_BRANCHES[@]}"; do
        if [[ "$branch" == "$pattern" ]]; then
            return 0
        fi
    done

    return 1
}


while IFS="|" read -r branch message date author; do

    if should_ignore "$branch"; then
        echo "Skipping (ignored): $branch"
        continue
    fi

    echo "-------------------------------------------------"
    echo -e "Branch: ${Green}$branch${Color_Off}"
    echo -e "Last commit: ${Green}$date${Color_Off}"
    echo "Author: $author"
    echo
    echo "$message"
    echo

    read -r -p 'Delete this branch? (y/n): ' confirm < /dev/tty

    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        git branch -D "$branch"
    else
        echo "Skipping $branch"
    fi
    echo "-------------------------------------------------"
done < <(git for-each-ref \
    --format='%(refname:short)|%(contents:subject)|%(committerdate:relative)|%(authorname) --sort=-committerdate)' refs/heads/ )

echo
echo "Running garbage collection:"
echo

git gc

echo
echo "Branches after cleanup:"
echo

git branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate
echo
