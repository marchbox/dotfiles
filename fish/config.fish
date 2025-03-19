# Paths
fish_add_path -P /opt/homebrew/bin /usr/local/bin /usr/bin /usr/sbin /sbin /usr/local/git/bin ~/bin ~/google-cloud-sdk/bin ~/Library/pnpm

# env
set EDITOR hx
set TERM xterm-256color

# nvm
set NVM_DIR ~/.nvm
nvm use node

# Commands
abbr --add l tre -l 2
abbr --add ll ls -lha
abbr --add md mkdir -p
abbr --add r rip

# Tools
abbr --add v hx
abbr --add h hx
abbr --add zz zellij
abbr --add za zellij a
abbr --add lg lazygit
abbr --add n npm
abbr --add nn npm run
abbr --add nnd npm run dev
abbr --add nnb npm run build
abbr --add nnn npm exec
abbr --add ff fzf
abbr --add y yazi

# Git
abbr --add g git
abbr --add gst git status
abbr --add gc git commit
abbr --add gcmsg git commit -m
abbr --add ga git add
abbr --add gd git diff
abbr --add gds git diff --staged
abbr --add gb git branch
abbr --add gco git checkout
abbr --add gp git push
abbr --add grhh git reset --hard
abbr --add gl git pull
abbr --add gcl git clean -df

# Key bindings
fish_vi_key_bindings
bind -M insert \cd accept-autosuggestion
bind -M insert \ck up-or-search
bind -M insert \cj down-or-search

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
