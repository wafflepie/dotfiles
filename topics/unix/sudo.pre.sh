if ! sudo grep -q "%wheel		ALL=(ALL) NOPASSWD: ALL # wafflepie/dotfiles" "/etc/sudoers"; then
  # Ask for the password upfront
  sudo -v

  # Keep-alive: update existing sudo time stamp until the script has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  sudo cp /etc/sudoers /etc/sudoers.back
  echo '%wheel		ALL=(ALL) NOPASSWD: ALL # wafflepie/dotfiles' | sudo tee -a /etc/sudoers > /dev/null
  sudo dscl . append /Groups/wheel GroupMembership $(whoami)
fi
