if is_macos; then
  # NOTE: Visualize CPU usage in the dock icon.
  defaults write com.apple.ActivityMonitor IconType -int 5

  # NOTE: Show all processes.
  defaults write com.apple.ActivityMonitor ShowCategory -int 0

  # NOTE: Sort results by CPU usage.
  defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
  defaults write com.apple.ActivityMonitor SortDirection -int 0
fi
