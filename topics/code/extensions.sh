for extension in $(cat "$DOTFILES/topics/code/extensions.txt"); do
  code --install-extension "$extension"
done
