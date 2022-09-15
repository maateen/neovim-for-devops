#! /bin/bash

declare -r PWD=$(pwd)
declare -r NVIM_CONFIG_DIR=$HOME/.config/nvim
declare -r VIM_PLUG="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim

######################
### Setup init.vim ###
######################
if $(hash nvim); then
    if [[ ! -f $VIM_PLUG ]]; then
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi

    if [[ ! -d $NVIM_CONFIG_DIR ]]; then mkdir -p $NVIM_CONFIG_DIR; fi
    ln -fFs $PWD/init.vim $NVIM_CONFIG_DIR/init.vim
    ln -fFs $NVIM_CONFIG_DIR/init.vim ~/.vimrc

    nvim +PlugUpgrade +PlugClean +PlugInstall +PlugUpdate +qall

    if $(hash go); then
        nvim +GoInstallBinaries +GoUpdateBinaries +qall
    fi

else
    echo "Oops! We could not find vim on your system."
fi