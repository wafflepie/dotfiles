#!/usr/bin/env bash

set -e
export DOTFILES="$HOME/.dotfiles"
cd "$DOTFILES"

for script in $(
  find topics -name '*.pre.sh'
  find topics -name '*.sh' ! -name '*.pre.sh' ! -name '*.post.sh'
  find topics -name '*.post.sh'
); do
  echo "> $script"
  source "$script"
done
