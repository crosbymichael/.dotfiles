#!/bin/bash

apt-get install -y --force-yes \
	curl \
	vim \
	git \
	ctags \
	wget \
	libc6-dev \
	autoconf \
	bison \
	cpp \
	gawk \
	gettext \
	libncurses5-dev \
	libbz2-dev \
	libreadline-dev \
	gcc \
	g++ \
	build-essential \
	make \
	automake \
	man-db \
	lxc \
	mosh \
	socat \
	tmux
    
curl -s http://go.googlecode.com/files/go1.2.linux-amd64.tar.gz | tar -v -C /usr/local -xz

wget http://fishshell.com/files/2.1.0/fish-2.1.0.tar.gz && tar -zxf fish-2.1.0.tar.gz &&\
	cd fish-2.1.0/ && ./configure --prefix=/usr/local && make && make install &&\
	echo '/usr/local/bin/fish' | tee -a /etc/shells && chsh -s /usr/local/bin/fish &&\
	cd && rm -rf fish-2.1.0 && rm fish-2.1.0.tar.gz

wget -O /usr/local/bin/docker https://get.docker.io/builds/Linux/x86_64/docker-latest && \
	chmod +x /usr/local/bin/docker

mkdir /var/log/docker
ln -s /root/home/docker.conf /etc/supervisor/conf.d/docker.conf

ln -s /root/home/vim /root/.vim && ln -s /root/home/vimrc /root/.vimrc
mkdir -p /root/.config/fish && ln -s /root/home/config.fish /root/.config/fish/config.fish
ln -s /root/home/tmux.conf /root/.tmux.conf
ln -s /root/home/git/gitconfig /root/.gitconfig
ln -s /root/home/git/gitignore_global /root/.gitignore_global
