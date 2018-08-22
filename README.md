# Xorg

```
Fatal server error:
(EE) parse_vt_settings: Cannot open /dev/tty0 (Permission denied)
```

-> edit `/etc/X11/Xwrapper.config` as per https://unix.stackexchange.com/questions/246508

--------------------

`startx` yields this error

`/usr/lib/xorg/Xorg.wrap: Only console users are allowed to run the X server`

when called from a tmux session, but not from a tty.

-> Edit `/etc/X11/Xwrapper.config` and set `allowed_users=anybody`


# Auto-login user on startup

https://wiki.archlinux.org/index.php/getty#Automatic_login_to_virtual_console

Note: on Debian `agetty` is located on `/sbin/agetty`, not `/usr/bin/agetty`.
