#!/bin/bash
ROOT=`pwd`
OS=`uname`
today=`date +%Y%m%d`

echo "######################################################################"
echo "     Install Backaway's Configuration to $USER's $OS System"
echo "######################################################################"

case $OS in
	Darwin )
		echo "---> Installing zsh configuration for $OS"
		ln -fs $ROOT/Shell/zshrc-osx $HOME/.zshrc
        ln -fs $ROOT/Environment/environment.plist $HOME/Library/LaunchAgents/environment.plist
		;;
	Linux )
		echo "---> Installing zsh configuration for $OS"
		ln -fs $ROOT/Shell/zshrc-linux $HOME/.zshrc
		;;
	? )
		echo "Only supported for Linux and OS X"
		exit 1;;
esac

echo "---> Installing Backaway's PS1 configuration"
ln -fs $ROOT/Shell/backaway.zsh-theme $HOME/.oh-my-zsh/themes/backaway.zsh-theme

echo "---> Installing personal shell script"
if [ -d $HOME/Bin ]
then
	echo "     Backup Bin directory"
	mv $HOME/Bin $HOME/Bin.$today
elif [ -f $HOME/Bin ]
then
	echo "     Backup Bin file"
	mv $HOME/Bin $HOME/Bin.$today
fi
ln -fs $ROOT/Bin $HOME/Bin

echo "---> Installing molokai theme for ls command"
# for solarized theme
# ln -fs $ROOT/Dircolors/dircolors.solarized $HOME/.dircolors
# for molokai theme
# ln -fs $ROOT/Dircolors/dircolors.molokai.blue $HOME/.dircolors
ln -fs $ROOT/Dircolors/dircolors.molokai.red $HOME/.dircolors

echo "---> Installing git configuration"
echo "     Please change your personal information in $HOME/.gitconfig"
ln -fs $ROOT/RCS/gitconfig $HOME/.gitconfig
ln -fs $ROOT/RCS/gitignore_global $HOME/.gitignore

echo "---> Installing subversion configuration"
echo "     You have to enter root password to make svn vimdiff available"
mkdir -p $HOME/.subversion
ln -fs $ROOT/RCS/svnconfig $HOME/.subversion/config
sudo ln -fs $ROOT/RCS/diffwrap.sh /usr/local/bin/diffwrap.sh

echo "---> Installing YouCompleteMe's configure file"
ln -fs $ROOT/YouCompleteMe/ycm_c_conf.py $HOME/.ycm_c_conf.py
ln -fs $ROOT/YouCompleteMe/ycm_cpp_conf.py $HOME/.ycm_cpp_conf.py
ln -fs $ROOT/YouCompleteMe/ycm_extra_conf.py $HOME/.ycm_extra_conf.py
