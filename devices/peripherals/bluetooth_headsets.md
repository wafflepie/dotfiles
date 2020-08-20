Modify `/etc/pulse/default.pa`.

```
### Automatically load driver modules for Bluetooth hardware
ifexists module-bluetooth-policy.so
load-module module-bluetooth-policy auto_switch=false
.endif
```

```sh
sudo systemctl restart bluetooth
pulseaudio --kill
pulseaudio --start
```
