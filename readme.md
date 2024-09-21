# dotfiles

1. Install Homebrew: <https://brew.sh/>
2. Install nvm: <https://github.com/nvm-sh/nvm>
3. Install MonoLisa font: <https://monolisa.dev>
4. Clone this repo in home directory:
    ```sh
    cd ~
    git clone https://github.com/marchbox/dotfiles.git
    ```
5. Install tools: `./setup-install.sh`
6. Set up symlinks: `./setup-symlinks.sh`
7. In `~/.gitconfig`, add the following lines:
    ```
    [include]
    	path = ~/dotfiles/gitconfig
    ```

---

Current version is heavily inspired by <https://github.com/pawelgrzybek/dotfiles/>
