#!/bin/bash
# Toggle wallpaper-based theming on/off

STATE_FILE="$HOME/.cache/wallust-theme-toggle"
SCRIPTSDIR="$HOME/.config/hypr/scripts"

if [ -f "$STATE_FILE" ] && [ "$(cat "$STATE_FILE")" = "disabled" ]; then
  echo "enabled" > "$STATE_FILE"
  notify-send -u low "Wallpaper Theming" "Enabled — colors will update with wallpaper"

  # Re-apply colors from current wallpaper immediately
  "$SCRIPTSDIR/WallustSwww.sh"
else
  echo "disabled" > "$STATE_FILE"
  notify-send -u low "Wallpaper Theming" "Disabled — only wallpaper image will change"
fi
