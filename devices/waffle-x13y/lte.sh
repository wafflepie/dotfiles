#!/usr/bin/bash

if [[ "$1" = "down" ]]; then
  sudo ip link set wwan0 down
  exit
fi

cd ~/.dotfiles/submodules/xmm7360-pci

if [[ "$1" = "setup" ]]; then
  sudo pip3 install pyroute2 --user
  sudo pip3 install configargparse --user
  ln -s ~/.dotfiles/devices/waffle-x13y/lte.sh ~/.local/bin/lte
  make && make load
fi

sudo python3 rpc/open_xdatachannel.py --apn internet.t-mobile.cz
cd - > /dev/null
