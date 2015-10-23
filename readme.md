# Install

Checkout:

    cd ~
    git clone https://github.com/marchbox/dotfiles.git
    cd dotfiles
    git submodule init
    git submodule update

Create symlinks:

    ln -s ~/dotfiles/zshrc ~/.zshrc
    ln -s ~/dotfiles/tmuxconf ~/.tmux.conf
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/vimrc ~/.vimrc

# Vim

## Pathogen

Vim package management. <https://github.com/tpope/vim-pathogen>

## Use system clipboard in OS X

    brew install reattach-to-user-namespace

# zsh

1. Install oh-my-zsh: <http://ohmyz.sh>
2. Add .box-name file.
