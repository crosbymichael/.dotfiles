FROM debian:jessie

RUN apt-get update && apt-get install -y \
    curl \
    vim \
    git \
    ctags \
    wget \
    libc6-dev \
    autoconf \
    libbz2-dev \
    gcc \
    build-essential \
    make \
    automake \
    man-db \
    fish \
    procps \
    socat \
    tmux

RUN cd /root && wget https://go.googlecode.com/files/go1.2.1.src.tar.gz && tar zxvf go1.2.1.src.tar.gz && \
	cd go/src && ./all.bash && cd /root && rm go1.2.1.src.tar.gz

ENV HOME /root
RUN apt-get install -y locales && dpkg-reconfigure locales && locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8
ENV TERM xterm-256color
RUN chsh -s /usr/bin/fish

ADD . /root/.dotfiles

RUN ln -s /root/.dotfiles/vim /root/.vim && ln -s /root/.dotfiles/vimrc /root/.vimrc && \
    mkdir -p /root/.config/fish && ln -s /root/.dotfiles/config.fish /root/.config/fish/config.fish && \
    ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf && \
    ln -s /root/.dotfiles/git/gitconfig /root/.gitconfig && \
    ln -s /root/.dotfiles/git/gitignore_global /root/.gitignore_global && \
    ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks && \
    mkdir -p /root/.ssh && \
    ln -s /root/.dotfiles/sshconf  /root/.ssh/config && \
    ln -s /.dockerinit /usr/local/bin/docker

WORKDIR /root
ENTRYPOINT ["tmux"]
