#!/bin/sh
echo "init:" > Makefile
echo "\t\tln -fs `pwd`/vim ~/.vim" >> Makefile
echo "\t\tln -fs `pwd`/vimrc ~/.vimrc" >> Makefile
echo "\t\tln -fs `pwd`/gitconfig ~/.gitconfig" >> Makefile
echo "\t\tln -fs `pwd`/bashrc ~/.bashrc" >> Makefile

# initialize your dotfile env
make init
