#!/bin/sh

# Font awesome version 5 or later is required for the icons to work.

OS_ICON=""
IFACE="wlan0" # set the default interface to wlan0 by default

# Colors

RED="\[$(tput setaf 160)\]"
GREEN="\[$(tput setaf 118)\]"
BLUE="\[$(tput setaf 33)\]"
YELLOW="\[$(tput setaf 172)\]"
ORGANGE="\[$(tput setaf 166)\]"
PURPLE="\[$(tput setaf 190)\]"
RESET="\[$(tput sgr0)\]"

if [[ $(uname) == "Linux" ]]; then
	OS_ICON=" "
elif [[ $(uname) == "FreeBSD" ]]; then
	OS_ICON=" "
elif [[ $(uname) == "OpenBSD" ]]; then
	OS_ICON=" "
fi

vol () {
	VOL="  %$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F '0.' '{print $2}')"
	echo $VOL
}

kernel() {
    KERNEL="$OS_ICON $(uname -sr)"
    echo $KERNEL
}

hdd() {
    HDD_USAGE=" $(df -H /home/ | awk 'FNR == 2 {print $4}')"
    echo $HDD_USAGE
}

pack() {
    PACKAGES=" $(pacman -Q | wc -l)"
    echo $PACKAGES
}

ndate() {
	NDATE="  $(date +"%b %d %Y %I:%M")"
	echo $NDATE
}

bat() {
    BAT_CAP="$(cat /sys/class/power_supply/BAT0/capacity)"
    BAT_STATUS="$(cat /sys/class/power_supply/BAT0/status)"
    BAT_LVL=$(expr $BAT_CAP - 0)

    if [ "$BAT_LVL" -eq 100 ]
    then
        BAT_ICO="󰁹"
    fi

    if  [ "$BAT_LVL" -le 100 -a "$BAT_LVL" -gt 75 ]
    then
        BAT_ICO="󰂂"
    fi

    if [ "$BAT_LVL" -le 75 -a "$BAT_LVL" -gt 50 ]
    then
        BAT_ICO="󰂀"
    fi

    if [ "$BAT_LVL" -le  50 -a "$BAT_LVL" -gt 25 ]
    then
        BAT_ICO="󰁾"
    fi

    if [ "$BAT_LVL" -le 25 -a "$BAT_LVL" -gt 10 ]
    then
        BAT_ICO="󰁻"
    fi

    if [ "$BAT_LVL" -le 10 ]
    then
        BAT_ICO="󰂃"
    fi

    if [ $BAT_STATUS == Charging ]; then
        BAT_ICO="󰂄"
    fi
    echo "$BAT_ICO $BAT_CAP %"

}

backlight() {
    BACKLIGHT_DEV=intel_backlight # replace with acpi_video0 for other devices
    CUR_BRIGHT="$(cat /sys/class/backlight/$BACKLIGHT_DEV/brightness)"
    MAX_BRIGHTNESS="$(cat /sys/class/backlight/$BACKLIGHT_DEV/max_brightness)"
    BRIGHTNESS="$(python3 -c "from math import floor; a=$CUR_BRIGHT; b=$MAX_BRIGHTNESS; print(floor((a/b)*100))")"
    echo "󰃠  $BRIGHTNESS %"
}

weather() {
	CURR_WEATHER="$(curl https://wttr.in/barstow?format=3)"
	echo "$CURR_WEATHER"
}
status_bar() {
	echo "[ $(hdd) ] [ $(vol) ] [ $(backlight) ] [ $(bat) ] [ $(ndate) ]"
}

while true; do
    status_bar
    sleep 2
done
