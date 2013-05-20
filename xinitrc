#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4

xmodmap -e 'clear Lock'
setxkbmap -option caps:super

feh --randomize ~/Dropbox/Media/Wallpapers --bg-center

xcompmgr &
sudo ~/.dropbox-dist/dropboxd &

exec awesome
