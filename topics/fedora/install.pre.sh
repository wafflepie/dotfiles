sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install rpmfusion-free-release-tainted
sudo dnf install rpmfusion-nonfree-release-tainted

sudo dnf install fedora-workstation-repositories

if ! is_wsl; then
  sudo dnf install -y \
    @base-x \
    @"C Development Tools and Libraries" \
    @"Common NetworkManager Submodules" \
    @Core \
    @Fonts \
    @"Hardware Support" \
    @"Input Methods" \
    @Multimedia \
    @"Printing Support" \
    @Standard
fi

sudo dnf install -y @"C Development Tools and Libraries"
