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
  @Standard \
  baobab \
  gnome-calculator \
  gnome-disk-utility \
  gnome-keyring \
  gnome-keyring-pam \
  gnome-shell \
  gnome-shell-extension-appindicator \
  gnome-shell-extension-dash-to-dock \
  gnome-shell-extension-drive-menu \
  gnome-shell-extension-gpaste \
  gnome-terminal \
  gnome-terminal-nautilus \
  gnome-tweaks \
  gnome-weather \
  google-roboto-fonts \
  gpaste \
  htop \
  materia-gtk-theme \
  nautilus \
  NetworkManager-openvpn \
  NetworkManager-openvpn-gnome \
  papirus-icon-theme \
  ranger \
  seahorse \
  sqlite \
  tldr \
  vlc \

sudo dnf upgrade
sudo dnf autoremove

sudo systemctl set-default graphical.target
