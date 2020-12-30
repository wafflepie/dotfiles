if is_macos; then
  # NOTE: Set the icon size of dock items to 48 pixels.
  defaults write com.apple.dock tilesize -int 48

  # NOTE: Don't animate opening applications from the dock.
  defaults write com.apple.dock launchanim -bool false

  # NOTE: Remove the animation when hiding/showing the dock.
  defaults write com.apple.dock autohide-time-modifier -float 0

  # NOTE: Automatically hide and show the dock.
  defaults write com.apple.dock autohide -bool true

  # NOTE: Remove the delay before the dock is shown.
  defaults write com.apple.dock autohide-delay -float 0

  # NOTE: Make icons of hidden applications translucent.
  defaults write com.apple.dock showhidden -bool true

  # NOTE: Don't show recent applications.
  defaults write com.apple.dock show-recents -bool false
fi
