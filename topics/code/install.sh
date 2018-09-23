CODE_HOME="$HOME/Library/Application Support/Code"

mkdir -p "$CODE_HOME/User"
rm -rf "$CODE_HOME/User/snippets"

ln -sf "$DOTFILES/topics/code/settings.json" "$CODE_HOME/User/settings.json"
ln -sf "$DOTFILES/topics/code/keybindings.json" "$CODE_HOME/User/keybindings.json"
ln -s "$DOTFILES/topics/code/snippets" "$CODE_HOME/User/snippets"

for extension in $(cat "$DOTFILES/topics/code/extensions.txt"); do
  code --install-extension "$extension"
done
