```
Fatal server error:
(EE) parse_vt_settings: Cannot open /dev/tty0 (Permission denied)
```

-> edit `/etc/X11/Xwrapper.config` as per unix.stackexchange.com/questions/246508

====================

`startx` yields this error

`/usr/lib/xorg/Xorg.wrap: Only console users are allowed to run the X server`

when called from a tmux session, but not from a tty.

-> Edit `/etc/X11/Xwrapper.config` and set `allowed_users=anybody`