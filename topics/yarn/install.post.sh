curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo dnf install yarn

source config.zsh

yarn config set prefix ~/.yarn
yarn global add eslint grunt gulp node-gyp prettier serve puppeteer
