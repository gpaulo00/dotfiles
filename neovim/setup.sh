#!/bin/bash

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# link folder
mv ~/.config/nvim{,.bak} 2>/dev/null
ln -s $(pwd) ~/.config/nvim

# install plugins
nvim -c 'PlugInstall' -c 'qa!'
