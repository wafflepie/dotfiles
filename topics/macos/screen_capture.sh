# Save screenshots to the desktop
directory="${HOME}/Google Drive/Screenshots"
# mkdir -p "$directory"
defaults write com.apple.screencapture location -string "$directory"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
