osascript -e 'tell application "System Preferences" to quit'

# Always boot in verbose mode (not macOS GUI mode)
sudo nvram boot-args="-v"

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Fix blurry font rendering issue in macOS Mojave
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

for file in $DOTFILES/topics/macos/*.sh; do
  if [[ $(basename "$file") != "install.sh" ]]; then
    . "$file"
  fi
done
