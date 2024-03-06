#!/bin/bash

# Basics

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

yay github --noconfirm # install github cli
yay kitty --noconfirm # install kitty terminal
yay todoist-cli --noconfirm

gh auth login
git clone git@github.com:bosifullstack/dotfiles.git

echo "source dotfiles/linux/manjaro-zsh-prompt" >> ~/.zshrc

sudo pacman -S exa
sudo pacman -S the_silver_searcher
sudo pacman -S neovim
sudo pacman -S go
sudo pacman -S python3
sudo pacman -S xclip
npm install -g tldr

# install powerlevel10k

yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# install brew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/suricate/.bash_profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo pacman -S base-devel

# Install zsh tools

yay zsh-syntax-highlighting
yay zsh-autosuggestions

# Kitty basics

echo "include ~/dotfiles/terminal/kitty.conf" >> ~/.config/kitty/kitty.conf

# Vim basics

echo "source ~/dotfiles/vim/init.vim" >> ~/.vimrc
mkdir ~/.config/nvim
echo "source ~/dotfiles/nvim/init.vim" >> ~/.config/nvim/init.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Node basics

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
npm install --global yarn

# Manual stuff
#
# Install Jetbrains mono and add it to tweaks
# Add icons in terminal https://github.com/sebastiencs/icons-in-terminal
# Opera browser
