#!/bin/bash

cd /home/$USER_NAME

if [ -d "/usr/local/bin/fish" ]
then
    echo "Fish already installed..."
else
	wget http://fishshell.com/files/2.1.0/fish-2.1.0.tar.gz
	tar -zxf fish-2.1.0.tar.gz && cd fish-2.1.0
	./configure --prefix=/usr/local
	make && make install
    echo '/usr/local/bin/fish' | tee -a /etc/shells
	chsh -s /usr/local/bin/fish
fi 

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
fi
cd /home/$USER_NAME

# setup users home environment
export USER_NAME=michael

if [ -f "/home/$USER_NAME/.config/fish/config.fish" ]
then
    echo "Dotfiles already installed..."
else
    cd /home/$USER_NAME
    mkdir -p .ssh
    mkdir -p .config/fish

    rm -rf /home/$USER_NAME/.vim
    ln -s /home/$USER_NAME/.dotfiles/vim /home/$USER_NAME/.vim
    ln -s /home/$USER_NAME/.dotfiles/vimrc /home/$USER_NAME/.vimrc
    ln -s /home/$USER_NAME/.dotfiles/git/gitconfig /home/$USER_NAME/.gitconfig
    ln -s /home/$USER_NAME/.dotfiles/git/gitignore_global /home/$USER_NAME/.gitignore_global
    ln -s /home/$USER_NAME/.dotfiles/config.fish /home/$USER_NAME/.config/fish/config.fish
    ln -s /home/$USER_NAME/.dotfiles/tmux.conf /home/$USER_NAME/.tmux.conf
    ln -s /home/$USER_NAME/.dotfiles/sshconf /home/$USER_NAME/.ssh/config
fi
cd /home/$USER_NAME

chown -R $USER_NAME:$USER_NAME /home/$USER_NAME
groupadd docker
