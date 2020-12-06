if ! [[ -d "$HOME/.nvm" ]]; then
  git clone https://github.com/creationix/nvm.git ~/.nvm
  install_default_node=true
fi

export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

if [[ -n "$install_default_node" ]]; then
  sleep 3
  nvm install node
  nvm use node
  nvm alias default node

  unset install_default_node
fi
