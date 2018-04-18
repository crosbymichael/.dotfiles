#!/bin/bash

set -e

# update the host system
function update() {
    apt-get update && apt-get upgrade -yy
}

# install base software and dependencies
function install_base () {
    apt-get install -y \
        apparmor \
        cgroup-lite \
        curl \
        git \
        htop \
        libapparmor-dev \
        libseccomp-dev \
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
        curl \
        gdb \
        indent \
        libc6-dev \
        libclang-dev \
        libtool \
        man-db \
        manpages-dev \
        mercurial \
        openssh-client \
        procps \
        tree \
        valgrind \
        pkg-config \
        vim-nox
}

function go_install () {
	(
        cd $HOME
        curl -s https://dl.google.com/go/go1.10.1.linux-amd64.tar.gz | tar -zxf -
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
        update
        install_base
        ;;
    "dev")
        echo "installing development dependencies..."
        update
        install_base
        install_dev
		go_install
		setup_home
        source $HOME/.bashrc
        go_deps
        ;;
	"home")
		echo "Setup home dir..."
		setup_home
		;;
    *)
        echo "invalid install option"
        echo "the two options are for a 'server' install and a 'dev' install"
        exit 1
        ;;
esac
