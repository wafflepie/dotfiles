# NOTE: Removes gray border around the window.
# https://github.com/zeit/hyper/issues/3259
# https://github.com/electron/electron/issues/13164
defaults write -app Hyper NSRequiresAquaSystemAppearance -bool No
