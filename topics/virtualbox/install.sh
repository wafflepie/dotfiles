if ! is_wsl; then
  sudo dnf install VirtualBox akmod-VirtualBox kernel-devel-$(uname -r)
  sudo akmods
  sudo systemctl restart vboxdrv.service
fi
