if ! is_wsl && is_fedora; then
  sudo dnf install VirtualBox akmod-VirtualBox kernel-devel-$(uname -r)
  sudo akmods
  sudo systemctl restart vboxdrv.service
fi
