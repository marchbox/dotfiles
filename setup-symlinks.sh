# Create directories if they don't exist
[ -d ~/.config ] || mkdir ~/.config
[ -d ~/.nvm ] || mkdir ~/.nvm

ln -s ~/dotfiles/ghostty ~/.config/
ln -s ~/dotfiles/fish ~/.config/
ln -s ~/dotfiles/helix ~/.config/
ln -s ~/dotfiles/navi ~/.config/
ln -s ~/dotfiles/eza ~/.config/
ln -s ~/dotfiles/yazi ~/.config/
ln -s ~/dotfiles/starship/config.toml ~/.config/starship.toml
ln -s ~/dotfiles/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml
ln -s ~/dotfiles/scooter ~/.config/
ln -s ~/dotfiles/typos ~/.config/
ln -s ~/dotfiles/nvm/default-packages ~/.nvm/default-packages
