# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  #
# wallust template - colors-fish

# Terminal ANSI colors (complement kitty)
set -g fish_term24bit 1

# Syntax highlighting
set -g fish_color_normal {{foreground}}
set -g fish_color_command {{color5}}
set -g fish_color_param {{color6}}
set -g fish_color_error {{color1}}
set -g fish_color_end {{color3}}
set -g fish_color_operator {{color3}}
set -g fish_color_quote {{color4}}
set -g fish_color_redirection {{color5}}
set -g fish_color_escape {{color3}}
set -g fish_color_autosuggestion {{color8}}
set -g fish_color_selection --background={{color0}}
set -g fish_color_search_match --background={{color0}}
set -g fish_color_cancel {{color1}}
set -g fish_color_keyword {{color1}}

# Prompt colors
set -g fish_color_cwd {{color3}}
set -g fish_color_user {{color5}}
set -g fish_color_host {{color6}}
set -g fish_color_host_remote {{color5}}

# Pager (tab completion)
set -g fish_pager_color_progress {{color1}} --bold
set -g fish_pager_color_prefix {{color5}} --bold
set -g fish_pager_color_completion {{foreground}}
set -g fish_pager_color_description {{color8}}
set -g fish_pager_color_selected_background --background={{color0}}
set -g fish_pager_color_selected_prefix {{color5}} --bold
set -g fish_pager_color_selected_completion {{foreground}}
