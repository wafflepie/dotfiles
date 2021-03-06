if is_wsl && command -v code > /dev/null; then
  code_remote_directory="$HOME/.vscode-server"
  code_local_directory="$WINHOME/AppData/Roaming/Code"

  link_file "$TOPIC/settings.json" "$code_remote_directory/data/Machine/settings.json"

  # NOTE: It seems that the only file used in WSL is `settings.json` and there's no easy
  # way to create symlinks from Windows to WSL, so we only copy the files to the Windows path.
  # Ideally, we would just symlink the files to Windows so they'd be used in WSL too.
  cp "$TOPIC/settings.json" "$code_local_directory/User/settings.json"
  cp "$TOPIC/keybindings.json" "$code_local_directory/User/keybindings.json"
fi

if is_macos; then
  code_directory="$HOME/Library/Application Support/Code"

  link_file "$TOPIC/settings.json" "$code_directory/User/settings.json"
  link_file "$TOPIC/keybindings.json" "$code_directory/User/keybindings.json"
fi

if ! is_wsl && is_fedora; then
  code_directory="$HOME/.config/Code"

  link_file "$TOPIC/settings.json" "$code_directory/User/settings.json"
  link_file "$TOPIC/keybindings.json" "$code_directory/User/keybindings.json"
fi
