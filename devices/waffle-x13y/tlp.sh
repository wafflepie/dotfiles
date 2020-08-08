sudo dnf install tlp tlp-rdw
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://repo.linrunner.de/fedora/tlp/repos/releases/tlp-release.fc$(rpm -E %fedora).noarch.rpm
sudo dnf install akmod-acpi_call
sudo tlp start
sudo tlp-rdw enable
