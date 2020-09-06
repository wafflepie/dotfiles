if ! is_wsl && is_fedora; then
  sudo dnf install NetworkManager-openvpn NetworkManager-openvpn-gnome
fi
