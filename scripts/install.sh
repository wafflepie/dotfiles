#!/usr/bin/env bash

set -e

# Install homebrew
if test ! $(which brew); then
	echo "installing homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew
echo "> brew update"
brew update

# Run Homebrew through the Brewfile
echo "> brew bundle"
brew bundle

# Find the installers and run them iteratively
for install in $(find topics -name install.sh); do
	echo "> $install"
	$install
done
