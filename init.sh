#!/bin/bash

# As seen on https://wrotenwrites.com/a_modern_terminal_workflow_1/

# Install our handy stuff
brew install zsh tmux neovim/neovim/neovim python3 ag reattach-to-user-namespace
brew tap caskroom/cask
brew cask install iterm2
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim

# install fonts
brew tap caskroom/fonts
brew cask install font-fira-code


# Set default shell
chsh -s /usr/local/bin/zsh

# Remove old files
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null

# Create neovim dirs
mkdir -p ~/.config ~/.config/nvim

# setup symlinks to dotfiles
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/gitconfig ~/.gitconfig

# Tmux plugin manager
git remote add -f tpm https://github.com/tmux-plugins/tpm.git
git subtree add --prefix=tpm tpm master --squash

# Iterm dracula theme
git remote add -f iterm-dracula https://github.com/dracula/iterm.git
git subtree add --prefix=iterm-dracula/ iterm-dracula master --squash

