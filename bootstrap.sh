#!/bin/bash

set -e

# install base software and dependencies
function install_base () {
    apt-get install -y \
        apparmor \
        curl \
        git \
        htop \
        libapparmor-dev \
        make \
        tmux
}

# install additional go deps
function go_deps() {
	go get github.com/rogpeppe/godef
	go get golang.org/x/tools/imports
    go get github.com/crosbymichael/gistit
    go get github.com/crosbymichael/slex
    go get github.com/jstemmer/gotags
    go get github.com/monochromegane/the_platinum_searcher
    go get github.com/nsf/gocode
}

# install development deps and setup vim, bash, and other dotfiles
function install_dev() {
    apt-get install --no-install-recommends -y \
        autoconf \
        bison \
        build-essential \
        ca-certificates \
        clang \
        ctags \
        indent \
        libc6-dev \
        libclang-dev \
        libtool \
        man-db \
        manpages-dev \
        tree \
        pkg-config \
        vim
}

function update_go () {
	(
        cd $HOME
		rm -fr $HOME/go
        curl -s https://dl.google.com/go/go1.12.9.linux-amd64.tar.gz | tar -zxf -
    )
}

function setup_home () {
    cd $HOME

    rm -rf $HOME/.vim
    ln -s $HOME/.dotfiles/vim $HOME/.vim || true
	ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc || true
    ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf || true
    rm -f $HOME/.gitconfig && ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig || true
    ln -s $HOME/.dotfiles/gitignore_global $HOME/.gitignore_global || true
    ln -s $HOME/.dotfiles/NERDTreeBookmarks $HOME/.NERDTreeBookmarks || true
    mkdir -p $HOME/.ssh && ln -s $HOME/.dotfiles/sshconf  $HOME/.ssh/config || true
    rm -f $HOME/.bashrc && ln -s $HOME/.dotfiles/bashrc $HOME/.bashrc || true
    rm -f $HOME/.bash_profile && ln -s $HOME/.dotfiles/bashrc $HOME/.bash_profile || true

    ln -s $HOME/development/gocode/src/github.com/docker/docker $HOME/docker || true
    ln -s $HOME/development/gocode/src/github.com/containerd $HOME/containerd  || true
    ln -s $HOME/development/gocode/src/github.com/opencontainers/runc $HOME/runc || true
    ln -s $HOME/development/gocode/src/github.com $HOME/github || true

    # additional home directories
    mkdir -p $HOME/scratch
}

# main entrypoint
case "$1" in
    "server")
        echo "installing server dependencies..."
        install_base
        ;;
    "dev")
        echo "installing development dependencies..."
        install_base
        install_dev
		update_go
		setup_home
        source $HOME/.bashrc
        ;;
	"home")
		echo "Setup home dir..."
		setup_home
		;;
    *)
        ;;
esac
