autoload -U add-zsh-hook

# https://github.com/creationix/nvm#zsh
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# https://github.com/creationix/nvm/issues/782#issuecomment-356309452
# https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type -f __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

  declare -a __yarn_commands=()
  
  if [ -s "$HOME/.config/yarn/global/package.json" ]; then
    __yarn_commands=`cat "$HOME/.config/yarn/global/package.json" | jq -r '.dependencies | keys[]'`
  fi

  declare -a __node_commands=(
    nvm node npm npx yarn
    $__yarn_commands
  )

  echo $__node_commands

  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh

    if [[ -f .nvmrc && -r .nvmrc ]]; then
      nvm use &>/dev/null
    elif [[ $(nvm version) != $(nvm version default) ]]; then
      nvm use default &>/dev/null
    fi

    add-zsh-hook chpwd load-nvmrc
    load-nvmrc

    unset __node_commands
    unset -f __init_nvm
  }

  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi
