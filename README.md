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

# Fonts

## Using bitmap icons for status bar

After installing [siji](https://github.com/stark/siji), you need to run

`# dpkg-reconfigure fontconfig fontconfig-config`

and answer **YES** to the third question (bitmap fonts are disabled by default)

## Configure TTY font to be able to see Powerline glyphs

Don't use `dpkg-reconfigure console-setup`. Download [Terminess PSF files](https://github.com/powerline/fonts/tree/master/Terminus/PSF),
put them somewhere (e.g. `/usr/share/consolefonts/`) and edit `/etc/default/console-setup` setting `FONT=/absolute/path/to/font.psf.gz`.

Comment the `FONTFACE` et al. lines.

Run `setupcon`.
