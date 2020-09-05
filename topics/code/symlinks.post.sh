if command -v code; then
  if is_wsl; then
    code_remote_directory="$HOME/.vscode-server"
    code_local_directory="$HOME/winhome/AppData/Roaming/Code"

    link_file "$TOPIC/settings.json" "$code_remote_directory/data/Machine/settings.json"
    cp "$TOPIC/keybindings.json" "$code_local_directory/User/keybindings.json"
    rm -rf "$code_local_directory/User/snippets"
    cp -r "$TOPIC/snippets" "$code_local_directory/User"
  else
    code_directory="$HOME/.config/Code"

    link_file "$TOPIC/settings.json" "$code_directory/User/settings.json"
    link_file "$TOPIC/keybindings.json" "$code_directory/User/keybindings.json"
    link_file "$TOPIC/snippets" "$code_directory/User/snippets"
  fi
fi
