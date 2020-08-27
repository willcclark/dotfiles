# Start an Xorg server on tty1 if not already running.
[ "$(tty)" = "/dev/tty3" ] && ! pidof Xorg >/dev/null 2>&1  && 

if (( $+commands[luarocks] )); then
    eval `luarocks path --bin`
fi

# Start gnome on tty1 if not already running
# if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty ]]; then
#   MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
# fi
