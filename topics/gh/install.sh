if ! command -v gh > /dev/null; then
  sudo zypper addrepo https://cli.github.com/packages/rpm/gh-cli.repo
  sudo zypper refresh
  sudo zypper install gh
fi
