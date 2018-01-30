#!/bin/bash

DIR=$(pwd)

# backup old files
mv ~/.gitconfig{,.bak}
mv ~/.hgrc{,.bak}

# link the configuration files
ln -s $DIR/gitconfig ~/.gitconfig
ln -s $DIR/hgrc ~/.hgrc
