# https://www.iterm2.com/documentation-shell-integration.html
curl -L https://iterm2.com/shell_integration/zsh \
-o "$DOTFILES/topics/iterm2/iterm2_shell_integration.zsh"

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/topics/iterm2"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
