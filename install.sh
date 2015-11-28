#!/bin/bash
ROOT=`pwd`
OS=`uname`
today=`date +%Y%m%d`

echo "######################################################################"
echo "     Installing Backaway's Configuration for $USER's $OS System"
echo "######################################################################"

case $OS in
	Darwin )
		echo "---> Installing zsh configuration for $OS"
		ln -fs $ROOT/Shell/zshrc-osx ~/.zshrc
		;;
	Linux )
		echo "---> Installing zsh configuration for $OS"
		ln -fs $ROOT/Shell/zshrc-linux ~/.zshrc
		;;
	? )
		echo "Only supported for Linux and OS X"
		exit 1;;
esac

echo "---> Installing Backaway's PS1 configuration"
ln -fs $ROOT/Shell/backaway.zsh-theme ~/.oh-my-zsh/themes/backaway.zsh-theme

echo "---> Installing personal shell to home directory"
mv ~/Bin ~/Bin.$today
ln -fs $ROOT/Bin ~/Bin

echo "---> Installing molokai theme for ls command"
# for solarized theme
# ln -fs `pwd`/dircolors.solarized ~/.dircolors" >> Makefile
# for molokai theme
# ln -fs `pwd`/dircolors.molokai.blue ~/.dircolors
ln -fs $ROOT/Dircolors/dircolors.molokai.red ~/.dircolors

echo "---> Installing git configuration"
echo "     Please change your personal information in $HOME/.gitconfig"
ln -fs $ROOT/RCS/gitconfig ~/.gitconfig
ln -fs $ROOT/RCS/gitignore_global ~/.gitignore_global

echo "---> Installing subversion configuration"
echo "     You have to enter root password to make svn vimdiff available"
mkdir -p ~/.subversion
ln -fs $ROOT/RCS/svnconfig ~/.subversion/config
sudo ln -fs $ROOT/RCS/diffwrap.sh /usr/local/bin/diffwrap.sh

echo "---> Installing YouCompleteMe's configure file"
ln -fs $ROOT/YouCompleteMe/ycm_c_conf.py ~/.ycm_c_conf.py
ln -fs $ROOT/YouCompleteMe/ycm_cpp_conf.py ~/.ycm_cpp_conf.py
ln -fs $ROOT/YouCompleteMe/ycm_extra_conf.py ~/.ycm_extra_conf.py
