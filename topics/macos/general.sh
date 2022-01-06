if is_macos; then
  # NOTE: Avoid creating .DS_Store files on network volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

  # NOTE: Disable the "Are you sure you want to open this application?" dialog.
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  # NOTE: Require password immediately after sleep or screen saver begins.
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0
fi
