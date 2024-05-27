#!/bin/bash

echo "checking dependencies..."

# Some notes for the dependencies
# - rg = ripgrep
# - ag = silversearcher-ag
deps=("curl" "node" "rg" "ag" "nvim")

for dep in "${deps[@]}"
do
    if ! command -v "$dep" &> /dev/null
    then
        echo "'$dep' is not installed!"
        exit 1
    fi
done

echo "dependencies is complete!"

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
cp -r nvim ~/.config/

echo "done."
