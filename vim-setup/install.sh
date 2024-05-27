#!/bin/bash

set -e

echo "checking dependencies..."

check_deps() {
    local deps_str="$1"
    local required=$2

    IFS=' ' read -r -a deps <<< "$deps_str"

    for dep in "${deps[@]}"
    do
        if ! command -v "$dep" &> /dev/null
        then
            printf "'$dep' is not installed"
            if ! "$required"; then
                echo " (optional)"
            else
                echo
                exit 1
            fi
        fi
    done
}


# Some notes for the dependencies
# - rg = ripgrep
# - ag = silversearcher-ag
check_deps "curl node rg ag nvim git" true

echo "dependencies is complete!"

# nvm could be installed with this:
# - curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
check_deps "nvm python3 pip3" false

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
# somehow the behaviour of `cp -r` is weird
mkdir -p ~/.config/nvim
cp -r ./nvim/* ~/.config/nvim

# install all the plugins
nvim -c PlugInstall

echo "done."

echo "Setup for python configuration? [y/n]"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ; then
    echo "Setting up python configuration..."

    check_deps "python3 pip3" true

    pip3 install jedi  # static analysis, autocomplete and goto
    pip3 install flake8  # linter

    # installing the plugins
    nvim -c "CocInstall coc-python"

    echo "done"
fi
