if is_opensuse; then
  if ! [[ -f /usr/bin/dnf ]]; then
    sudo ln -s /usr/bin/zypper /usr/bin/dnf
  fi
fi
