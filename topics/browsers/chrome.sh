if ! rpm -q google-chrome-stable; then
  sudo dnf install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
fi

sudo dnf install chrome-gnome-shell
