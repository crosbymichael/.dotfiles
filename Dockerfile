FROM ubuntu:13.10

RUN apt-get update && apt-get install -y \
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
    socat \
    tmux

RUN wget https://go.googlecode.com/files/go1.2.src.tar.gz && tar zxvf go1.2.src.tar.gz && \
	cd go/src && ./all.bash && cd && rm go1.2.src.tar.gz

RUN wget http://fishshell.com/files/2.1.0/fish-2.1.0.tar.gz && tar -zxf fish-2.1.0.tar.gz &&\
	cd fish-2.1.0/ && ./configure --prefix=/usr/local && make && make install &&\
	echo '/usr/local/bin/fish' | tee -a /etc/shells && chsh -s /usr/local/bin/fish &&\
	cd && rm -rf fish-2.1.0 && rm fish-2.1.0.tar.gz

ADD . /root/.dotfiles

RUN ln -s /root/.dotfiles/vim /root/.vim && ln -s /root/.dotfiles/vimrc /root/.vimrc
RUN mkdir -p /root/.config/fish && ln -s /root/.dotfiles/config.fish /root/.config/fish/config.fish
RUN ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf
RUN ln -s /root/.dotfiles/git/gitconfig /root/.gitconfig
RUN ln -s /root/.dotfiles/git/gitignore_global /root/.gitignore_global
RUN ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks
RUN mkdir -p /root/.ssh
RUN ln -s /root/.dotfiles/sshconf  /root/.ssh/config
RUN ln -s /.dockerinit /usr/local/bin/docker

ENV HOME /root
RUN locale-gen en_US.UTF-8
RUN /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TERM xterm-256color

WORKDIR /root
ENTRYPOINT ["tmux"]
