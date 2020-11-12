if is_wsl; then
  if ! command -v wslvar > /dev/null; then
    sudo zypper addrepo https://download.opensuse.org/repositories/home:/wslutilities/openSUSE_Leap_15.1/home:wslutilities.repo
    sudo zypper refresh
    sudo zypper install wslu
  fi

  source config.zsh

  sudo rm -f /etc/wsl.conf
  sudo cp "$TOPIC/wsl.conf" /etc/wsl.conf
fi
