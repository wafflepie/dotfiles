if ! is_wsl && is_fedora; then
  sudo rpm --import https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key
  sudo cp insync.repo /etc/yum.repos.d/
  sudo dnf install insync
fi
