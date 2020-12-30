if is_macos; then
  # NOTE: Save screenshots to Google Drive.
  defaults write com.apple.screencapture location -string "${HOME}/Google Drive/Screenshots"

  # NOTE: Save screenshots in PNG format.
  defaults write com.apple.screencapture type -string "png"

  # NOTE: Disable shadow in screenshots.
  defaults write com.apple.screencapture disable-shadow -bool true
fi
