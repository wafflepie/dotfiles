if is_macos; then
  # NOTE: Disable autocorrect.
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

  # NOTE: Disable press-and-hold for keys in favor of key repeat.
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # NOTE: Set a blazingly fast keyboard repeat rate.
  defaults write NSGlobalDomain KeyRepeat -int 2
  defaults write NSGlobalDomain InitialKeyRepeat -int 15

  # NOTE: Disable automatic capitalization.
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

  # NOTE: Disable smart dashes.
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

  # NOTE: Disable automatic period substitution.
  defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

  # NOTE: Disable smart quotes.
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
fi
