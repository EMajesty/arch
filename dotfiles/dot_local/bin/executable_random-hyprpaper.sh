#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Pick first monitor; tweak if you want per-monitor handling
MONITOR="$(hyprctl monitors -j | jq -r '.[0].name')"

WALLPAPER="$(find "$WALLPAPER_DIR" -type f | shuf -n 1)"

hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER"
sleep 1
hyprctl hyprpaper unload unused
