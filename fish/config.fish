# Paths
fish_add_path -P /opt/homebrew/bin /usr/local/bin /usr/bin /usr/sbin /sbin /usr/local/git/bin ~/bin ~/google-cloud-sdk/bin

# env
set EDITOR hx

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
abbr --add nn npm run
abbr --add ff fzf

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

# fzf key bindings
fzf --fish | source

# Starship prompt
starship init fish | source
