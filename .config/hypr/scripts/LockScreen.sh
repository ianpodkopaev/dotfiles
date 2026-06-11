#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##

# Use hyprlock with proper error handling
hyprlock

# If hyprlock exits with error, try with fallback
if [ $? -ne 0 ]; then
    # Try with basic config if main config fails
    notify-send "hyprlock failed, trying fallback..."
    hyprlock --config ~/.config/hypr/hyprlock-fallback.conf 2>/dev/null || \
    hyprlock --config /dev/null 2>/dev/null
fi
