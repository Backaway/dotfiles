#!/bin/sh
echo "init:" > Makefile
echo "\t\tln -fs `pwd`/gitconfig ~/.gitconfig" >> Makefile
echo "\t\tln -fs `pwd`/zshrc ~/.zshrc" >> Makefile

# initialize your dotfile env
make init
