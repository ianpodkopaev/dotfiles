#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Reload colors for kitty, waybar, fish, spicetify after wallust runs

logger -t wallust-reload "WallustReload.sh started"

# Reload kitty config (SIGUSR1 makes kitty reload its config)
if pidof kitty >/dev/null; then
    killall -SIGUSR1 kitty
    logger -t wallust-reload "reloaded kitty"
fi

logger -t wallust-reload "checking spicetify colors: $HOME/.config/spicetify/Themes/marketplace/color.ini"

# Apply spicetify colors (strip # prefix and reload spotify theme)
spicetify_colors="$HOME/.config/spicetify/Themes/marketplace/color.ini"
if [ -f "$spicetify_colors" ]; then
    logger -t wallust-reload "stripping # from spicetify colors"
    sed -i 's/ = #/ = /g' "$spicetify_colors"
    logger -t wallust-reload "running spicetify apply"
    ~/.spicetify/spicetify apply -n 2>/dev/null
    logger -t wallust-reload "spicetify apply finished"
fi

# Reload waybar CSS (SIGUSR2 reloads config without restarting)
if pidof waybar >/dev/null; then
    killall -SIGUSR2 waybar 2>/dev/null
fi
