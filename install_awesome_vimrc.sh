#!/bin/sh
set -e

cd ~/.nvim_runtime
mkdir ~/.config/nvim

echo 'set runtimepath+=~/.nvim_runtime
source ~/.nvim_runtime/vimrcs/plugins.vim
source ~/.nvim_runtime/vimrcs/basic.vim
source ~/.nvim_runtime/vimrcs/filetypes.vim
source ~/.nvim_runtime/vimrcs/plugins_config.vim
source ~/.nvim_runtime/vimrcs/extended.vim
' > ~/.config/nvim/init.vim

cp ./.pylintrc ~/

cat ~/.nvim_runtime/pip_requirements.txt | xargs pip3 install
cat ~/.nvim_runtime/requirements.txt | xargs brew install
cat ~/.nvim_runtime/npm_requirements.txt | xargs npm -D install

echo 'alias vim=nvim' >> ~/.bashrc
echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
