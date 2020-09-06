if ! is_wsl && is_fedora; then
  sudo dnf install snapd

  if ! [[ -d /snap ]]; then
    sudo ln -s /var/lib/snapd/snap /snap
  fi
fi
