# Paths
fish_add_path -P /opt/homebrew/bin /usr/local/bin /usr/bin /usr/sbin /sbin /usr/local/git/bin ~/bin ~/google-cloud-sdk/bin ~/Library/pnpm

# env
set -gx EDITOR hx
set -gx TERM xterm-256color
set -gx EZA_CONFIG_DIR ~/.config/eza

# theme

set --global fish_color_autosuggestion 969896
set --global fish_color_cancel --reverse
set --global fish_color_command b294bb
set --global fish_color_comment f0c674
set --global fish_color_cwd green
set --global fish_color_cwd_root red
set --global fish_color_end b294bb
set --global fish_color_error cc6666
set --global fish_color_escape 00a6b2
set --global fish_color_history_current --bold
set --global fish_color_host normal
set --global fish_color_host_remote
set --global fish_color_keyword
set --global fish_color_match --background=brblue
set --global fish_color_normal normal
set --global fish_color_operator 00a6b2
set --global fish_color_option
set --global fish_color_param 81a2be
set --global fish_color_quote b5bd68
set --global fish_color_redirection 8abeb7
set --global fish_color_search_match white --background=brblack
set --global fish_color_selection white --bold --background=brblack
set --global fish_color_status white
set --global fish_color_user brgreen
set --global fish_color_valid_path --underline
set --global fish_pager_color_background
set --global fish_pager_color_completion normal
set --global fish_pager_color_description B3A06D
set --global fish_pager_color_prefix normal --bold --underline
set --global fish_pager_color_progress brwhite --background=cyan
set --global fish_pager_color_secondary_background
set --global fish_pager_color_secondary_completion
set --global fish_pager_color_secondary_description
set --global fish_pager_color_secondary_prefix
set --global fish_pager_color_selected_background --background=6b3698
set --global fish_pager_color_selected_completion
set --global fish_pager_color_selected_description
set --global fish_pager_color_selected_prefix

# nvm
set NVM_DIR ~/.nvm
nvm use node

# Commands
abbr --add l eza -1a
abbr --add ll eza -loa
abbr --add lll eza -1aT -L 2
abbr --add md mkdir -p
abbr --add r rip
abbr --add mv mv -vi
abbr --add cp cp -vi

# Tools
abbr --add v hx
abbr --add h hx
abbr --add vv hx --config ~/.config/helix/config-qwerty.toml
abbr --add zz zellij
abbr --add za zellij a
abbr --add gg lazygit
abbr --add n npm
abbr --add nn npm run
abbr --add nnd npm run dev
abbr --add nnb npm run build
abbr --add nnn npm exec
abbr --add ff fzf
abbr --add ss scooter

# Git
abbr --add g git
abbr --add gst git status
abbr --add gc git commit
abbr --add gcm git commit -m
abbr --add gcmsg git commit -m
abbr --add ga git add
abbr --add gd git diff
abbr --add gds git diff --staged
abbr --add gb git branch
abbr --add gco git checkout
abbr --add gp git push
abbr --add gpf git push --force-with-lease
abbr --add grhh git reset --hard
abbr --add gl git pull
abbr --add gcl git clean -df

# Key bindings
set --global fish_key_bindings fish_vi_key_bindings
bind -M insert \cd accept-autosuggestion
bind -M insert \ce up-or-search
bind -M insert \cn down-or-search
bind -M insert \co clear-screen

# fzf key bindings
fzf --fish | source

# yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Starship prompt
starship init fish | source

# fx JSON viewer
fx --comp fish | source
