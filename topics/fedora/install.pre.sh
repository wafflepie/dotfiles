if is_fedora; then
  sudo dnf install \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
    rpmfusion-free-release-tainted \
    rpmfusion-nonfree-release-tainted \
    fedora-workstation-repositories \

  if is_wsl; then
    sudo dnf install -y @"C Development Tools and Libraries"
  else
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
fi
