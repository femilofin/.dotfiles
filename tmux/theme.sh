#### COLOUR
tm_color_active=colour32
tm_color_inactive=colour241
tm_color_feature=colour206
tm_color_music=colour215
tm_active_border_color=colour240
tm_inactive_status=colour241
color_orange="colour166" # 208, 166
color_purple="colour134" # 135, 134
color_green="colour076"  # 070
color_blue="colour39"
color_yellow="colour220"
color_red="colour160"
color_black="colour232"
color_white="white" # 015

# This is a theme CONTRACT, you are required to define variables below
# Change values, but not remove/rename variables itself
color_dark="$color_black"
color_light="$color_white"
color_session_text="$color_blue"
color_status_text="colour245"
color_main="$color_orange"
color_secondary="$color_purple"
color_level_ok="$color_green"
color_level_warn="$color_yellow"
color_level_stress="$color_red"
color_window_off_indicator="colour088"
color_window_off_status_bg="colour238"
color_window_off_status_current_bg="colour254"

# separators
tm_separator_left_bold="◀"
tm_separator_left_thin="❮"
tm_separator_right_bold="▶"
tm_separator_right_thin="❯"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
# set-option -g status-bg colour0
set-option -g status-fg $tm_color_active
set-option -g status-bg default
# set-option -g status-attr default

# default window title colors
# set-window-option -g window-status-fg $tm_color_inactive
# set-window-option -g window-status-bg default
set -g window-status-format "#I #W"

# active window title colors
# set-window-option -g window-status-current-fg $tm_color_active
# set-window-option -g window-status-current-bg default
set-window-option -g window-status-current-format "#[bold]#I #W"

# pane border
# set-option -g pane-border-fg $tm_color_inactive
# set-option -g pane-active-border-fg $tm_active_border_color

# message text
# set-option -g message-bg default
# set-option -g message-fg $tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

# clock
set-window-option -g clock-mode-colour $tm_color_active

tm_online_status="#{online_status}"
tm_tunes="#[fg=$tm_color_music]#(osascript -l JavaScript ~/.dotfiles/applescripts/itunes.js)"
tm_date="#[fg=$tm_color_inactive] %R %d %b"
tm_host="#[fg=$tm_color_feature,bold]#h"
tm_session_name="#[fg=$tm_color_feature,bold]#S"
tm_is_keys_off="#[fg=$color_light,bg=$color_window_off_indicator]#([ $(tmux show-option -qv key-table) = 'off' ] && echo 'OFF')#[default]"

set -g status-left $tm_session_name' '$tm_is_keys_off' '
set -g status-right $tm_tunes' '$tm_date' '$tm_online_status

# Also, change some visual styles when window keys are off
bind -T root F12 \
  set prefix None \; \
  set key-table off \; \
  set status-style "fg=$color_status_text,bg=$color_window_off_status_bg" \; \
  if -F '#{pane_in_mode}' 'send-keys -X cancel' \; \
  refresh-client -S \;

bind -T off F12 \
  set -u prefix \; \
  set -u key-table \; \
  set -u status-style \; \
  refresh-client -S
