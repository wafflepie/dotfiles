export NVM_DIR="$HOME/.nvm"

source "$NVM_DIR/nvm.sh"

autoload -U add-zsh-hook

load-nvmrc() {
	if [[ -f .nvmrc && -r .nvmrc ]]; then
		nvm use &>/dev/null
	elif [[ $(nvm version) != $(nvm version default) ]]; then
		nvm use default &>/dev/null
	fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
