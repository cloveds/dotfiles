# ~/.xinitrc
feh --bg-scale ~/282c34.png &
picom -b &
xfce4-terminal -e ./autostart.sh &
exec i3
