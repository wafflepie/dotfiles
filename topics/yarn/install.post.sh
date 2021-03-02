if ! command -v yarn > /dev/null; then
  if is_ubuntu; then
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt update
    sudo apt install --no-install-recommends yarn
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
  node-gyp \
  prettier \
  serve \
