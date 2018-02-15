#!/bin/bash

# backup old
mv ~/.vimrc{,.bak}
mv ~/.vim{,.bak}

# link files
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd) ~/.vim
