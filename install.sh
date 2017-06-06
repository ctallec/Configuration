#!/bin/bash

# flush vimrc
rm ~/.vimrc
ln -s $(pwd)/.vimrc ~/.vimrc

# install vundle and all plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# install deps
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev

# compile YCM
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
