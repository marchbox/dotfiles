# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$HOME/bin:$HOME/Library/Python/2.7/bin"
# export MANPATH="/usr/local/man:$MANPATH"

eval $(/opt/homebrew/bin/brew shellenv)

# ZSH_THEME="robbyrussell"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# User configuration
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux vi-mode z)

source $ZSH/oh-my-zsh.sh

# vi-mode
bindkey -v

# vim
alias v='vim'

# zsh
alias zshc='v ~/.zshrc'
alias zshs='source ~/.zshrc'

alias search='grep --exclude-dir=node_modules -lRs '

# etc
alias grow="/Users/zackyma/bin/grow"

# local override
source ~/.zshlocalrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# The next line updates PATH for Netlify's Git Credential Helper.
test -f '/Users/marchbox/Library/Preferences/netlify/helper/path.zsh.inc' && source '/Users/marchbox/Library/Preferences/netlify/helper/path.zsh.inc'

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
