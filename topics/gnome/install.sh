if ! is_wsl && is_fedora; then
  sudo dnf install \
    baobab \
    gnome-calculator \
    gnome-disk-utility \
    gnome-keyring \
    gnome-keyring-pam \
    gnome-shell \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-drive-menu \
    gnome-shell-extension-user-theme \
    gnome-terminal \
    gnome-terminal-nautilus \
    gnome-tweaks \
    nautilus \
    seahorse \

  gsettings set org.gnome.nautilus.preferences click-policy single

  sudo systemctl set-default graphical.target
fi
