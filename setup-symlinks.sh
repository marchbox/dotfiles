# Create directory if it doesn't exist
[ -d ~/.config ] || mkdir ~/.config

ln -s ~/dotfiles/rio ~/.config/
ln -s ~/dotfiles/fish ~/.config/
ln -s ~/dotfiles/helix ~/.config/
ln -s ~/dotfiles/zellij ~/.config/
ln -s ~/dotfiles/navi ~/.config/
ln -s ~/dotfiles/starship/config.toml ~/.config/starship.toml
ln -s ~/dotfiles/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
