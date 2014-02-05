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

wget http://fishshell.com/files/2.1.0/fish-2.1.0.tar.gz && tar -zxf fish-2.1.0.tar.gz &&\
	cd fish-2.1.0/ && ./configure --prefix=/usr/local && make && make install &&\
	echo '/usr/local/bin/fish' | tee -a /etc/shells && chsh -s /usr/local/bin/fish &&\
	cd && rm -rf fish-2.1.0 && rm fish-2.1.0.tar.gz


ln -s /root/.dotfiles/vim /root/.vim && ln -s /root/.dotfiles/vimrc /root/.vimrc
mkdir -p /root/.config/fish && ln -s /root/.dotfiles/config.fish /root/.config/fish/config.fish
ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf
ln -s /root/.dotfiles/git/gitconfig /root/.gitconfig
ln -s /root/.dotfiles/git/gitignore_global /root/.gitignore_global
ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks
ln -s /root/.dotfiles/sshconf  /root/.ssh/config

systemctl disable firewalld
systemctl stop firewalld
