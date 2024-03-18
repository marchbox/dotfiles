# Paths
fish_add_path -P /opt/homebrew/bin /usr/local/bin /usr/bin /usr/sbin /sbin /usr/loca/git/bin ~/bin

# env
set EDITOR hx

# nvm
set NVM_DIR ~/.nvm
nvm use node

# Commands
abbr --add l tre
abbr --add ll ls -lha
abbr --add md mkdir -p
abbr --add r rip

# Tools
abbr --add v hx
abbr --add h hx
abbr --add zz zellij
abbr --add za zellij a

# Git
abbr --add g git
abbr --add gst git status
abbr --add gc git commit
abbr --add gcmsg git commit -m
abbr --add ga git add
abbr --add gd git diff
abbr --add gb git branch
abbr --add gco git checkout
abbr --add gp git push
abbr --add grhh git reset --hard
abbr --add gl git pull

# Key bindings
fish_vi_key_bindings
bind -M insert \cd accept-autosuggestion

# Syntax highlighting variables
# https://fishshell.com/docs/current/interactive.html#syntax-highlighting-variables
set fish_color_normal white
set fish_color_command white
set fish_color_keyword white
set fish_color_quote white
set fish_color_redirection white
set fish_color_end white
set fish_color_error red
set fish_color_param white
set fish_color_valid_path white
set fish_color_option white
set fish_color_comment black
set fish_color_selection green
set fish_color_operator white
set fish_color_escape white
set fish_color_autosuggestion black
# set fish_color_cwd white
# set fish_color_cwd_root white
# set fish_color_user white
# set fish_color_host white
# set fish_color_host_remote white
# set fish_color_status white
set fish_color_cancel red --bold
set fish_color_search_match green
set fish_color_history_current green

# Pager color variables
# https://fishshell.com/docs/current/interactive.html#pager-color-variables
set fish_pager_color_progress green
# set fish_pager_color_background --background=black
set fish_pager_color_prefix white --bold
set fish_pager_color_completion black
set fish_pager_color_description white
set fish_pager_color_selected_background --background=blue
set fish_pager_color_selected_prefix black --bold
set fish_pager_color_selected_completion black
set fish_pager_color_selected_description black
# set fish_pager_color_secondary_background --background=black
set fish_pager_color_secondary_prefix white --bold
set fish_pager_color_secondary_completion black
set fish_pager_color_secondary_description white
