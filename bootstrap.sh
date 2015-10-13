#!/bin/bash

# for solarized theme
# echo "\t\tln -fs `pwd`/dircolors.solarized ~/.dircolors" >> Makefile
# for molokai theme
# ln -fs `pwd`/dircolors.molokai.blue ~/.dircolors
ln -fs `pwd`/dircolors.molokai.red ~/.dircolors

# for git
ln -fs `pwd`/gitconfig ~/.gitconfig
ln -fs `pwd`/gitignore_global ~/.gitignore_global

# for svn
mkdir -p ~/.subversion
ln -fs `pwd`/svnconfig ~/.subversion/config
sudo ln -fs `pwd`/diffwrap.sh /usr/local/bin/diffwrap.sh

# for zsh
ln -fs `pwd`/zshrc ~/.zshrc
ln -fs `pwd`/wanghuizhou.zsh-theme ~/.oh-my-zsh/themes/wanghuizhou.zsh-theme

# for YouCompleteMe
ln -fs `pwd`/ycm_c_conf.py ~/.ycm_c_conf.py
ln -fs `pwd`/ycm_cpp_conf.py ~/.ycm_cpp_conf.py
ln -fs `pwd`/ycm_extra_conf.py ~/.ycm_extra_conf.py
