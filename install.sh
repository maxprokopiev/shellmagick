#!/bin/sh

# use zsh by default
if ! grep -q "root.*/bin/zsh" /etc/passwd
then
  chsh -s /bin/zsh root
fi

ln -fs $PWD/zsh/.zsh $HOME/.zsh
ln -fs $PWD/zsh/pure/pure.zsh $HOME/.zsh/prompt_pure_setup
ln -fs $PWD/zsh/.zshrc $HOME/.zshrc
ln -fs $PWD/.config/nvim/init.vim $HOME/.config/nvim/init.vim
