#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

git submodule update --init

PACKAGES_NEEDED="\
    neovim \
    silversearcher-ag \
    bat"

if ! dpkg -s ${PACKAGES_NEEDED} > /dev/null 2>&1; then
    if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
        sudo apt-get update
    fi
    sudo echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
    sudo apt-get -y -q install ${PACKAGES_NEEDED}
fi

ln -fs $PWD/zsh/.zsh $HOME/.zsh
ln -fs $PWD/zsh/pure/pure.zsh $HOME/.zsh/prompt_pure_setup
ln -fs $PWD/zsh/.zshrc $HOME/.zshrc

ln -fs $PWD/.tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.config/nvim
ln -fs $PWD/.config/nvim/init.vim $HOME/.config/nvim/init.vim
nvim --headless +'PlugInstall --sync' +qa

ln -fs $PWD/git/.gitconfig $HOME/.gitconfig
ln -fs $PWD/git/.gitignore $HOME/.gitignore

mkdir -p $HOME/.config/Code/User
ln -fs $PWD/vscode/settings.json $HOME/.config/Code/User/settings.json

wget https://github.com/BlakeWilliams/remote-development-manager/releases/latest/download/rdm-linux-amd64
sudo mv rdm-linux-amd64 /usr/local/bin/rdm
chmod +x /usr/local/bin/rdm

# use zsh by default
sudo chsh -s "$(which zsh)" "$(whoami)"
