mkdir -p $HOME/Library/Application\ Support/Code/User
rm -rf $HOME/Library/Application\ Support/Code/User/snippets

ln -sf $DOTFILES/topics/code/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -sf $DOTFILES/topics/code/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -s $DOTFILES/topics/code/snippets $HOME/Library/Application\ Support/Code/User/snippets
