#!/usr/bin/env bash

ROOT="$1"
shift

find "$ROOT" -type d -name ".git" | while read -r gitdir; do
    repo="$(dirname "$gitdir")"

    echo "=== $repo ==="

    (
        cd "$repo" || exit 1
        "$@"
    )

    echo
done
