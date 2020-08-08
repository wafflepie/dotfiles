sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install rpmfusion-free-release-tainted
sudo dnf install rpmfusion-nonfree-release-tainted
sudo dnf install fedora-workstation-repositories

sudo dnf install \
  @base-x \
  @"C Development Tools and Libraries" \
  @"Common NetworkManager Submodules" \
  @Core \
  @Fonts \
  @"Hardware Support" \
  @"Input Methods" \
  @Multimedia \
  @"Printing Support" \
  gnome-shell \
  gnome-terminal \
  gnome-tweaks \
  nautilus \
  NetworkManager-openvpn \
  NetworkManager-openvpn-gnome \
  ranger

sudo dnf upgrade
sudo dnf autoremove

sudo systemctl set-default graphical.target
