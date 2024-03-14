# Create directory if it doesn't exist
[ -d ~/.config ] || mkdir ~/.config

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/fish ~/.config/
ln -s ~/dotfiles/helix ~/.config/
ln -s ~/dotfiles/zellij ~/.config/
