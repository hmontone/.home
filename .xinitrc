autorandr -c
xbindkeys
dunst &
xset s 0 0
xss-lock xsecurelock &
while true
do
	fmt='%s   %3s  %4s  %4s  %16s  %-2s %4s '
	<<-EOF xargs printf "$fmt" | xargs -I{} xsetroot -name "{}"
	"$(iw wlan0 link | sed -En 's/\tSSID: //p')"
	"$(! systemctl -q is-active openconnect@* || echo VPN)"
	"$(amixer get Master | awk -F [][] '1<NF{if($4=="on")print$2;exit}')"
	"$(amixer get Capture | awk -F [][] '1<NF{if($4=="on")print$2;exit}')"
	"$(date +'%F %H:%M')"
	"$(grep -q 0 /sys/class/power_supply/AC/online || echo AC)"
	"$(cat /sys/class/power_supply/BAT0/capacity)%"
	EOF
	sleep 1
done &
tabbed -r 2 -f -n terminal st -w '' -f monospace:pixelsize=16 &
exec dwm >/dev/null
