Prepend the following to `/etc/ssh/sshd_config.d/50-redhat.conf`.

```
PasswordAuthentication no
PermitEmptyPasswords no
HostbasedAuthentication no
```

```sh
chmod 600 ~/.dotfiles/topics/ssh/.ssh+authorized_keys
sudo systemctl restart sshd
```
