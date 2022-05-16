#!/bin/sh

git submodule update --init

sudo apt-get -y install neovim

ln -fs $PWD/zsh/.zsh $HOME/.zsh
ln -fs $PWD/zsh/pure/pure.zsh $HOME/.zsh/prompt_pure_setup
ln -fs $PWD/zsh/.zshrc $HOME/.zshrc

mkdir -p $HOME/.config/nvim
ln -fs $PWD/.config/nvim/init.vim $HOME/.config/nvim/init.vim

mkdir -p $HOME/.config/Code/User
ln -fs $PWD/vscode/settings.json $HOME/.config/Code/User/settings.json

# use zsh by default
sudo chsh -s "$(which zsh)" "$(whoami)"
