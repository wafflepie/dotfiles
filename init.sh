#!/usr/bin/env bash

set -e
export DOTFILES="$(dirname "$0")"
initial_directory="$(pwd)"
cd "$DOTFILES"
git submodule update --init --recursive

for script in $(find functions -name '*.sh'); do
  source "$script"
done

for src in $(find topics -name '.*' | grep -v '.DS_Store'); do
  dst="$(basename "$src" | sed 's/+/\//g')"
  link_file "$DOTFILES/$src" "$HOME/$dst"
done

for script in $(
  find topics -name '*.pre.sh'
  find topics -name '*.sh' ! -name '*.pre.sh' ! -name '*.post.sh'
  find topics -name '*.post.sh'
); do
  TOPIC="$(dirname "$script")"
  cd "$TOPIC"
  echo "> $script"
  source "$(basename "$script")"
  cd "$DOTFILES"
done

echo "dotfiles successfully set up"
cd "$initial_directory"
