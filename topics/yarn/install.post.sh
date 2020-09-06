if ! command -v yarn > /dev/null; then
  if is_opensuse; then
    sudo zypper addrepo https://download.opensuse.org/repositories/devel:languages:nodejs/openSUSE_Leap_15.2/devel:languages:nodejs.repo
    sudo zypper refresh
    sudo zypper install yarn
  fi

  if is_fedora; then
    curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
    sudo dnf install yarn
  fi
fi

source config.zsh

yarn config set prefix ~/.yarn

yarn global add \
  eslint \
  grunt \
  gulp \
  node-gyp \
  prettier \
  puppeteer \
  serve \
  tldr \
