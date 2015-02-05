#!/bin/bash

echo linking repo vimrc to the .vimrc init file
if [ -d "$HOME/vimstuff" ]; then
	ln -sf ~/vimstuff/.vimrc ~/.vimrc 
	ln -s $HOME/vimstuff/ $HOME/.vim
	if [ -d "$HOME/vimstuff" ]; then
		cd $HOME/vimstuff/bundle
	else
		mkdir $HOME/vimstuff/bundle
		cd $HOME/vimstuff/bundle
	fi
fi
