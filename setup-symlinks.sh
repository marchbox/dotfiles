# Create directory if it doesn't exist
[ -d ~/.config ] || mkdir ~/.config

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmuxconf ~/.tmux.conf
ln -s ~/dotfiles/helix ~/.config/
