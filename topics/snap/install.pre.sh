sudo dnf install snapd

if ! [[ -d /snap ]]; then
  sudo ln -s /var/lib/snapd/snap /snap
fi
