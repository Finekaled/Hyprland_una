#!/bin/bash

# Check if user provided an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path-to-image>"
    exit 1
fi

IMAGE="$1"

# Send notification to the user
notify-send "Changing Theme" "Applying new wallpaper and updating colours, please wait until confirmation..."

# Set wallpaper
swww img "$IMAGE" --transition-type="center" --transition-step=1 --transition-fps="60"

# Generate pywal colours
wal -i "$IMAGE" -n -s -t -e

# Make nvim use pywal colours
python3 /home/andrew/.config/nvim/pywal/chadwal.py

# Refresh Spotify
pywal-spicetify Dribbblish

# Use Matugen to generate Material You colours

# Refresh waybar
pkill waybar
waybar > /dev/null 2>&1 &

# Refresh swaync
pkill swaync
swaync > /dev/null 2>&1 &

notify-send "Theme Applied" "Wallpaper and theme updated successfully!"

