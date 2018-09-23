sudo cp /etc/hosts /etc/hosts.backup
sudo wget https://someonewhocares.org/hosts/hosts -O /etc/hosts
sudo bash -c "cat $DOTFILES/topics/hosts/hosts /etc/hosts | sponge /etc/hosts"
