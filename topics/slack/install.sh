if ! is_wsl && is_fedora; then
  if ! rpm -q slack; then
    sudo dnf install https://downloads.slack-edge.com/linux_releases/slack-4.8.0-0.1.fc21.x86_64.rpm
  fi
fi
