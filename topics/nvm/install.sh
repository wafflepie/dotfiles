if ! [[ -d "$HOME/.nvm" ]]; then
  git clone https://github.com/creationix/nvm.git ~/.nvm
  __INSTALL_DEFAULT_NODE=true
fi

# We always initialize nvm because of other topics, such as yarn/install.sh
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh"

if [[ -n "$__INSTALL_DEFAULT_NODE" ]]; then
  sleep 3
  nvm install node
  nvm use node
  nvm alias default node

  unset __INSTALL_DEFAULT_NODE
fi
