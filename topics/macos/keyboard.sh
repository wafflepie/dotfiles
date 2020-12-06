# NOTE: Disable autocorrect.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# NOTE: Disable press-and-hold for keys in favor of key repeat.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# NOTE: Set a blazingly fast keyboard repeat rate.
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# NOTE: Disable automatic capitalization as it's annoying when typing code.
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# NOTE: Disable smart dashes as they're annoying when typing code.
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# NOTE: Disable automatic period substitution as it's annoying when typing code.
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# NOTE: Disable smart quotes as they're annoying when typing code.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
