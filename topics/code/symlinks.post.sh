if is_wsl; then
  code_server_directory="$HOME/.vscode-server"

  link_file "$TOPIC/settings.json" "$code_server_directory/data/Machine/settings.json"
else
  code_directory="$HOME/.config/Code"

  link_file "$TOPIC/settings.json" "$code_directory/User/settings.json"
  link_file "$TOPIC/keybindings.json" "$code_directory/User/keybindings.json"
  link_file "$TOPIC/snippets" "$code_directory/User/snippets"
fi
