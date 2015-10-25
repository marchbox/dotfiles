# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

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
plugins=(git tmux vi-mode)

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# vi-mode
bindkey -v

# vim
EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias v='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# brew
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# zsh
alias zshc='v ~/.zshrc'
alias zshs='source ~/.zshrc'

# etc
alias grow="/Users/zackyma/bin/grow"

