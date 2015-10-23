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

- Install oh-my-zsh: <http://ohmyz.sh>


# Resources

- [Vim & Tmux & System Clipboard](https://coderwall.com/p/j9wnfw/vim-tmux-system-clipboard)
- [Synchronizing plugins with git submodules and pathogen](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)
