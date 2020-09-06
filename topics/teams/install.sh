if ! is_wsl && is_fedora; then
  if ! rpm -q teams; then
    sudo dnf install https://packages.microsoft.com/yumrepos/ms-teams/teams-1.3.00.16851-1.x86_64.rpm
  fi
fi
