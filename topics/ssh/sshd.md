Prepend the following to `/etc/ssh/sshd_config.d/50-redhat.conf`.

```
PasswordAuthentication no
PermitEmptyPasswords no
HostbasedAuthentication no
```
