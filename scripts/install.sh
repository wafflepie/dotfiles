#!/usr/bin/env bash

set -e
export DOTFILES="$HOME/.dotfiles"
cd "$DOTFILES"

for script in $(
  find topics -name install.pre.sh;
  find topics -name install.sh;
  find topics -name install.post.sh;
); do
  echo "> $script"
  . "$script"
done
