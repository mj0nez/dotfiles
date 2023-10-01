#!/bin/bash

args=( "$@" )

# Parse arguments
# see https://unix.stackexchange.com/questions/129391/passing-named-arguments-to-shell-scripts
while [ $# -gt 0 ]; do
  case "$1" in
    --message*|-m*)
      if [[ "$1" != *=* ]]; then shift; fi # Value is next arg if no `=`
      message="${1#*=}"
      ;;
  esac
  shift
done

# add node_modules to path: https://grrr.tech/posts/relative-path/
#export PATH=./node_modules/.bin:./vendor/bin:$PATH

# pass commit message to linter and then create the actual commit
basePath="$HOME/repositories/dotfiles"

echo ${message} | $basePath/node_modules/.bin/commitlint \
      --config=$basePath/commitlint.config.js \
      --verbose \
      && git commit "${args[@]}"
