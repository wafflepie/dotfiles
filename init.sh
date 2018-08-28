#!/usr/bin/env bash

set -e
export DOTFILES=$HOME/.dotfiles
cd $DOTFILES
./scripts/bootstrap.sh
