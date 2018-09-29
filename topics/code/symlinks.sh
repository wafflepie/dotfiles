CODE_HOME="$HOME/Library/Application Support/Code"

mkdir -p "$CODE_HOME/User"
rm -rf "$CODE_HOME/User/snippets"

link_file "$DOTFILES/topics/code/settings.json" "$CODE_HOME/User/settings.json"
link_file "$DOTFILES/topics/code/keybindings.json" "$CODE_HOME/User/keybindings.json"
link_file "$DOTFILES/topics/code/snippets" "$CODE_HOME/User/snippets"
