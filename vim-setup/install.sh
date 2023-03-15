#!/bin/bash

VIM_PLUG=~/.vim/autoload/plug.vim

if test -f "$VIM_PLUG"; then
    echo "vim-plug installed."
else
    echo "installing vim-plug..."
    
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
    echo "vim-plug installed."
fi

cp .vimrc ~/
cp nvim ~/.config/ -r

echo "done."
