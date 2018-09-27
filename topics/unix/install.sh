sudo cp /etc/hosts /etc/hosts.backup
sudo wget https://someonewhocares.org/hosts/hosts -O /etc/hosts
sudo bash -c "cat $DOTFILES/topics/unix/hosts /etc/hosts | sponge /etc/hosts"

wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
