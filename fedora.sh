#!/bin/bash

yum install \
	tmux \
	vim \
	gcc \
	wget \
	cpp \
	lxc \
	tar \
	make \
	automake \
	autoconf \
	git \
	socat \
	gcc-c++ \
	ncurses-devel \
    ctags


wget https://go.googlecode.com/files/go1.2.src.tar.gz && tar zxvf go1.2.src.tar.gz && \
	cd go/src && ./all.bash && cd

ln -s /root/.dotfiles/vim /root/.vim && ln -s /root/.dotfiles/vimrc /root/.vimrc
ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf
ln -s /root/.dotfiles/git/gitconfig /root/.gitconfig
ln -s /root/.dotfiles/git/gitignore_global /root/.gitignore_global
ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks
ln -s /root/.dotfiles/sshconf  /root/.ssh/config
rm /root/.bashrc
ln -s /root/.dotfiles/bashrc  /root/.bashrc

systemctl disable firewalld
systemctl stop firewalld
