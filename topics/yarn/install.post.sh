if ! command -v yarn > /dev/null; then
  sudo zypper addrepo https://download.opensuse.org/repositories/devel:languages:nodejs/openSUSE_Leap_15.2/devel:languages:nodejs.repo
  sudo zypper refresh
  sudo zypper install yarn
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
