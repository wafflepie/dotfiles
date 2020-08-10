sudo dnf install VirtualBox akmod-VirtualBox kernel-devel-$(uname -r)
sudo akmods
sudo systemctl restart vboxdrv.service
