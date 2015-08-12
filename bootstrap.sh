#!/bin/sh
echo "init:" > Makefile
echo "\t\tln -fs `pwd`/gitconfig ~/.gitconfig" >> Makefile
echo "\t\tln -fs `pwd`/zshrc ~/.zshrc" >> Makefile
# for solarized theme
# echo "\t\tln -fs `pwd`/dircolors.solarized ~/.dircolors" >> Makefile
# for molokai theme
echo "\t\tln -fs `pwd`/dircolors.molokai ~/.dircolors" >> Makefile
echo "\t\tln -fs `pwd`/ycm_c_conf.py ~/.ycm_c_conf.py" >> Makefile
echo "\t\tln -fs `pwd`/ycm_cpp_conf.py ~/.ycm_cpp_conf.py" >> Makefile
echo "\t\tln -fs `pwd`/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme" >> Makefile

# initialize your dotfile env
make init
