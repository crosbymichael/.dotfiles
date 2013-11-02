#!/bin/bash

# compiles

cd /home/$USER_NAME

if [ -d "/usr/local/bin/vim" ]
then
    echo "Vim already installed..."
else
    hg clone https://vim.googlecode.com/hg/ vim
    cd vim/src
    ./configure --prefix=/usr/local --enable-gui=no --without-x --disable-nls --enable-multibyte --with-tlib=ncurses --enable-pythoninterp --with-features=huge
    make
    make install
fi

cd /home/$USER_NAME

if [ -d "$HOME/go/bin/go" ]
then
    echo "Go already installed..."
else 
    export GOROOT=$HOME/go
    export GOBIN=$GOROOT/bin
    export GOPATH=$HOME/development/gocode
    hg clone https://code.google.com/p/go
    cd go/src/
    ./all.bash
    source ~/.dotfiles/bin/crosscompile.bash
    go-crosscompile-build-all
fi
cd /home/$USER_NAME

