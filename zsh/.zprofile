# Autostart X on login if it's not already running && this is tty1

if ! xhost &> /dev/null && [[ $XDG_VTNR -eq 1 ]]; then
    startx
fi
