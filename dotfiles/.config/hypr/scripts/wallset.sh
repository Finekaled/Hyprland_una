#!/bin/bash

# Directory containing wallpapers
WALL_DIR=$HOME/wallpapers

#Current directory (to cd back to)
CWD="$(pwd)"

cd "$WALL_DIR" || exit

# Handle spaces in filenames
IFS=$'/n'

# Grab user-selected wallpaper
SELECTED_WALL=$(for a in *.jpg *.png; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -p "")

# If not empty, pass to wallset-backend
if [ -n "$SELECTED_WALL" ]; then
    ~/.local/bin/./wallset-backend.sh "$SELECTED_WALL"
fi

# Go back to original directory.
cd "$CWD" || exit
