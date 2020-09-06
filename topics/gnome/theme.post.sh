if ! is_wsl && is_fedora; then
  sudo dnf install \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-drive-menu \
    gnome-shell-extension-gpaste \
    gnome-shell-extension-user-theme \
    gnome-tweaks \
    papirus-icon-theme \

  sudo dnf install gtk-murrine-engine gtk2-engines

  vimix_path="$HOME/Repositories/vimix-gtk-themes"

  if [[ ! -d "$vimix_path" ]]; then
    mkdir -p "$vimix_path"
    git clone https://github.com/vinceliuice/vimix-gtk-themes.git "$vimix_path"
    cd "$vimix_path"
    ./install.sh
    cd - > /dev/null
  fi
fi
