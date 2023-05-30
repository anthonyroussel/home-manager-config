{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    clock24 = true;
    mouse = true;
    terminal = "screen-256color";

    extraConfig = ''
      # resize tmux with Ctrl-Shift and arrows
      bind-key -n C-S-Up resize-pane -U 5
      bind-key -n C-S-Down resize-pane -D 5
      bind-key -n C-S-Left resize-pane -L 10
      bind-key -n C-S-Right resize-pane -R 10

      # inspired from http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/
      # switch panes using Alt-arrow without prefix
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # status bar
      set -g status-justify centre
      set -g status-left " #(echo $USER)@#T"
      set -g status-left-length 150
      set -g status-right "#[fg=black]%h %d %Y #[fg=white]%l:%M %p "

      # inspired from https://www.captainark.net/my-tmux-configuration.html
      #
      # inactive window format
      set-window-option -g window-status-format '#I:#W#F'
      set-window-option -g monitor-activity on

      # activity in a window
      set-window-option -g window-status-activity-style bg=default,fg=yellow,dim

      # active window format
      set-window-option -g window-status-current-style bg=default,fg=white
      set-window-option -g window-status-current-format '#[fg=red](#[default]#I:#W#F#[fg=red])#[default]'
    '';
  };
}
