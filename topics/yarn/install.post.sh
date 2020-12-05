if is_wsl && ! command -v yarn > /dev/null; then
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update
  sudo apt install --no-install-recommends yarn
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
