if is_macos; then
  if ! [[ $(which brew) ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  brew update
  brew bundle -v
  brew upgrade
  brew cleanup
fi
