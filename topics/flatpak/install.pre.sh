if ! is_wsl && is_fedora; then
  sudo dnf install flatpak
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi
