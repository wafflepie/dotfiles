#!/usr/bin/env bash

set -e

# Git setup
if ! [ -f topics/git/gitconfig.local.symlink ]; then
	echo 'setting up gitconfig'

	git_credential='osxkeychain'

	echo 'enter your github full name'
	read -e git_authorname
	echo 'enter your github e-mail'
	read -e git_authoremail

	sed -e "s/AUTHORNAME/$git_authorname/g" \
		-e "s/AUTHOREMAIL/$git_authoremail/g" \
		-e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" \
		topics/git/gitconfig.local.symlink.example > topics/git/gitconfig.local.symlink

	echo 'gitconfig successfully set up'
fi

# Passwordless sudo
if ! sudo grep -q "%wheel		ALL=(ALL) NOPASSWD: ALL #wafflepie/dotfiles" "/etc/sudoers"; then
	sudo -v

	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &

	sudo cp /etc/sudoers /etc/sudoers.back
	echo '%wheel		ALL=(ALL) NOPASSWD: ALL #wafflepie/dotfiles' | sudo tee -a /etc/sudoers >/dev/null
	sudo dscl . append /Groups/wheel GroupMembership $(whoami)
	echo "You can now run sudo commands without password!"
fi

echo "linking symlinks"
./scripts/symlinks.sh
echo "symlinks linked"

echo "installing dependencies and topics"
./scripts/install.sh
echo "dependencies and topics installed"

echo "everything is done"
