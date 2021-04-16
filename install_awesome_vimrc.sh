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
cp ./.tmux.conf  ~/

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
