#!/usr/bin/bash

cd ~/.dotfiles/devices/waffle-x13y/xmm7360-pci

if [[ "$1" = "setup" ]]; then
  ln -s ~/.dotfiles/devices/waffle-x13y/lte.sh ~/.local/bin/lte
  make && make load
fi

sudo python3 rpc/open_xdatachannel.py --apn internet.t-mobile.cz
cd - > /dev/null
