if ! [[ $(which brew) ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew bundle -v
brew upgrade
brew cask upgrade
brew cleanup
brew prune
