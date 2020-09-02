if ! is_wsl; then
  if ! ls /etc/NetworkManager/system-connections | grep -q PIA; then
    wget https://www.privateinternetaccess.com/installer/pia-nm.sh
    sudo bash ./pia-nm.sh
    rm -f pia-nm.sh
  fi
fi
