BATPATH=/sys/class/power_supply/BAT0/
BATTERY_LEFT=0

[ ! -d $BATPATH ] && exit

battery_full=$(cat $BATPATH/energy_full)
battery_now=$(cat $BATPATH/energy_now)

BATTERY_LEFT=$(( 100 * $battery_now /$battery_full ))
