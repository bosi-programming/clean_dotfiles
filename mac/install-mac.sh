#!/bin/bash

# Basics
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm i 20
echo "source ~/dotfiles/mac/zshrc-mac" >> ~/.zshrc

# Kitty
brew install kitty
touch ~/.config/kitty/kitty.conf
echo "include ~/dotfiles/terminal/kitty.conf" >> ~/.config/kitty/kitty.conf
echo "include ~/dotfiles/mac/mac-kitty.conf" >> ~/.config/kitty/kitty.conf

brew install brave
brew install the_silver_searcher neovim go xclip ripgrep fzf
npm install -g tldr

# Fonts
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font

# Vim basics

echo "source ~/dotfiles/vim/init.vim" >> ~/.vimrc
mkdir ~/.config/nvim
echo "source ~/dotfiles/vim/init.vim" >> ~/.config/nvim/init.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Node basics

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
npm install --global yarn

# Manual
#
# https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k
# Rectangle Pro (IMPORTANTE SER O PRO)
# Karabiner Elements
