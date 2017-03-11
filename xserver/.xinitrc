#export XMODIFIERS=@im=SCIM
#export GTK_IM_MODULE="scim"
#export QT_IM_MODULE="scim"
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xscreensaver &

# requires feh
# I wanted to use XMonad.Wallpaper, but it requires exactly
# version 0.12 and I use 0.13
feh -B black -bg-center ~/wallpapers/wallpaper &
xsetroot -cursor_name left_prt &
setxkbmap -layout de -variant neo
xset r rate 150 55
# TODO scim for traditional chinese input, with neo and pinyin
exec xmonad
