#!/usr/bin/env bash

set -e
export DOTFILES="$HOME/.dotfiles"
cd "$DOTFILES"

git submodule update --init

echo "setting up dotfiles"

. ./scripts/gitconfig.sh
. ./scripts/sudo.sh
. ./scripts/symlinks.sh
. ./scripts/install.sh

echo "dotfiles successfully set up"
