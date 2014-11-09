eval $(cat ~/.fehbg)
xset +fp /usr/share/fonts/dina/
xset +fp /usr/share/fonts/unifont/
xset fp rehash
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
urxvtd -q -f -o
remind -z -k'notify-send "Reminder" "%s" -u critical -i ~/.mutt/roaring_penguin.png' ~/.mutt/work.rem &
~/.mutt/mailnotify.sh &
eval $(gpg-agent --daemon --write-env-file ~/.mutt/gpg-agent.env)
while true; do
    xsetroot -name "$(date "+%A %F %R %Z")"
    sleep 1
done &
xscreensaver -no-splash &
~/scripts/dunst_state.sh &
unclutter -noevents -idle 5 &
exec dwm
