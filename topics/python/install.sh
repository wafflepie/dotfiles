if is_ubuntu; then
  sudo apt install python2 python3 python3-pip
fi

if is_fedora; then
  sudo dnf install python3 python3-devel python3-pip
fi
