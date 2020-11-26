if is_wsl; then
  source config.zsh

  sudo rm -f /etc/wsl.conf
  sudo cp "$TOPIC/wsl.conf" /etc/wsl.conf
fi
