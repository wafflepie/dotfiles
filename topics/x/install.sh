if is_wsl; then
  sudo apt install libgtk-3-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
  sudo touch /etc/sudoers.d/dbus
  sudo sh -c "echo '$(whoami) ALL = (root) NOPASSWD: /etc/init.d/dbus' > /etc/sudoers.d/dbus"
fi
