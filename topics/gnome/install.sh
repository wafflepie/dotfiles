if ! is_wsl && is_fedora; then
  sudo dnf install \
    baobab \
    gnome-calculator \
    gnome-disk-utility \
    gnome-keyring \
    gnome-keyring-pam \
    gnome-shell \
    gnome-terminal \
    gnome-terminal-nautilus \
    gnome-weather \
    gpaste \
    nautilus \
    seahorse \

  gsettings set org.gnome.nautilus.preferences click-policy single

  sudo systemctl set-default graphical.target
fi