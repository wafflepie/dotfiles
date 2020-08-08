sudo dnf install moreutils
sudo cp /etc/hosts /etc/hosts.backup
sudo wget https://someonewhocares.org/hosts/hosts -O /etc/hosts
sudo bash -c "cat hosts /etc/hosts | sponge /etc/hosts"
