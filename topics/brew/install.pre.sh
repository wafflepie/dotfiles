# Install Homebrew
if test ! $(which brew); then
  echo "installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew
echo "> brew update"
brew update

# Run Homebrew through the Brewfile, -v means that it won't run silently
echo "> brew bundle -v --file=$DOTFILES/topics/brew/Brewfile"
brew bundle -v --file=$DOTFILES/topics/brew/Brewfile

# Upgrade all previously installed CLI apps
echo "> brew upgrade"
brew upgrade

# Upgrade all previously installed GUI apps
echo "> brew cask upgrade"
brew cask upgrade

# Clean up all old formulae
echo "> brew cleanup"
brew cleanup
