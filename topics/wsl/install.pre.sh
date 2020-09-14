if is_opensuse && ! command -v wslvar > /dev/null; then
  sudo zypper addrepo https://download.opensuse.org/repositories/home:/wslutilities/openSUSE_Leap_15.1/home:wslutilities.repo
  sudo zypper refresh
  sudo zypper install wslu
fi

export WINHOME="$(wslpath "$(wslvar USERPROFILE)")"
