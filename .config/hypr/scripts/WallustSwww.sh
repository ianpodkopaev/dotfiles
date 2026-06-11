#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Wallust Colors for current wallpaper

# Find the awww cache version directory dynamically
cache_base="$HOME/.cache/awww"
cache_dir=$(find "$cache_base" -maxdepth 1 -type d -name '[0-9]*' | sort -V | tail -1)

if [ -z "$cache_dir" ]; then
  echo "awww cache directory not found"
  logger -t wallust "awww cache directory not found"
  exit 1
fi

# Initialize a flag
ln_success=false

# Get current focused monitor
current_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')
echo "monitor: $current_monitor"
# Construct the full path to the cache file
cache_file="$cache_dir/$current_monitor"
echo "cache: $cache_file"
# Check if the cache file exists for the current monitor output
if [ -f "$cache_file" ]; then
  # Get the wallpaper path from the cache file (null-separated fields)
  wallpaper_path=$(tr '\0' '\n' < "$cache_file" | grep '^/' | head -1)
  echo "wallpaper: $wallpaper_path"
  # symlink the wallpaper to the location Rofi can access
  if [ -n "$wallpaper_path" ] && ln -sf "$wallpaper_path" "$HOME/.config/rofi/.current_wallpaper"; then
    ln_success=true
  fi
  # copy the wallpaper for wallpaper effects
  [ -n "$wallpaper_path" ] && cp -r "$wallpaper_path" "$HOME/.config/hypr/wallpaper_effects/.wallpaper_current"
fi

# Check the flag before executing further commands
if [ "$ln_success" = true ]; then
  STATE_FILE="$HOME/.cache/wallust-theme-toggle"
  if [ -f "$STATE_FILE" ] && [ "$(cat "$STATE_FILE")" = "disabled" ]; then
    echo "wallust theming is disabled — skipping color generation"
    logger -t wallust "theming disabled — skipped"
  else
    # execute wallust
    logger -t wallust "running wallust for wallpaper: $wallpaper_path"
    /home/ian/.cargo/bin/wallust run "$wallpaper_path" -s
    logger -t wallust "wallust done"

    # reload kitty, waybar, and other UI components
    "$HOME/.config/hypr/scripts/WallustReload.sh" &
  fi
fi
