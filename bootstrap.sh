#!/bin/sh
echo "init:" > Makefile
echo "\t\tln -fs `pwd`/gitconfig ~/.gitconfig" >> Makefile
echo "\t\tln -fs `pwd`/bashrc ~/.bashrc" >> Makefile
echo "\t\tln -fs `pwd`/msmtprc ~/.msmtprc" >> Makefile
echo "\t\tln -fs `pwd`/muttrc ~/.muttrc" >> Makefile

# initialize your dotfile env
make init
