setxkbmap -layout "us,ru"
setxkbmap -option "grp:caps_toggle,grp_led:scroll"

xsetroot -cursor_name left_ptr &

export PATH=~/bin:$PATH

# Set background image with feh
feh --bg-scale /usr/share/backgrounds/ubuntu-default-greyscale-wallpaper.png

#exec startxfce4
#exec startkde
#exec gnome-session
exec dbus-launch xmonad
