if is_macos; then
  # NOTE: Show the ~/Library folder.
  chflags nohidden ~/Library

  # NOTE: Always open everything in list view.
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

  # NOTE: Show status bar.
  defaults write com.apple.finder ShowStatusBar -bool true

  # NOTE: Show path bar.
  defaults write com.apple.finder ShowPathbar -bool true

  # NOTE: Allow text selection in quick look.
  defaults write com.apple.finder QLEnableTextSelection -bool true

  # NOTE: Display full POSIX path as window title.
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

  # NOTE: When performing a search, search the current folder by default.
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

  # NOTE: Show hidden files by default.
  defaults write com.apple.finder AppleShowAllFiles -bool true

  # NOTE: Show all extensions.
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
fi
