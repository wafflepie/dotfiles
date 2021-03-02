if ! is_wsl && is_fedora; then
  if [[ ! -d /opt/Postman ]]; then
    wget -q -O postman.tar.gz https://dl.pstmn.io/download/latest/linux64
    sudo tar xf postman.tar.gz -C /opt
    rm -f postman.tar.gz
    sudo cp postman.desktop /usr/share/applications/
  fi
fi
