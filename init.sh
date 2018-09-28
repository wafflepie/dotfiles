#!/usr/bin/env bash

set -e
export DOTFILES="$HOME/.dotfiles"
cd "$DOTFILES"

git submodule update --init

echo "setting up dotfiles"

source ./scripts/gitconfig.sh
source ./scripts/sudo.sh
source ./scripts/symlinks.sh
source ./scripts/install.sh

echo "dotfiles successfully set up"
