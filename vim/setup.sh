#!/bin/bash

# backup old
mv ~/.vimrc{,.bak}

# link files
ln -s $(pwd)/vimrc ~/.vimrc
