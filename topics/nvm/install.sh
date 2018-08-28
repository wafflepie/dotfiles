if ! [[ -d "$HOME/.nvm" ]]; then
  git clone https://github.com/creationix/nvm.git ~/.nvm

  # Load nvm immediately
  export NVM_DIR="$HOME/.nvm"
  source "$NVM_DIR/nvm.sh"
  sleep 3

  nvm install $(cat topics/nvm/nvmrc.symlink)
fi
