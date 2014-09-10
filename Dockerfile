FROM debian:jessie

RUN apt-get update && apt-get install -y \
        build-essential ca-certificates curl \
        git mercurial \
        --no-install-recommends

ENV GOLANG_VERSION 1.3.1

RUN curl -sSL http://golang.org/dl/go$GOLANG_VERSION.src.tar.gz \
    | tar -v -C /usr/src -xz
WORKDIR /usr/src/go

RUN cd src && ./make.bash --no-clean 2>&1

ENV PATH /usr/src/go/bin:$PATH

RUN mkdir -p /go/src
ENV GOPATH /go
ENV PATH /go/bin:$PATH
WORKDIR /go

RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    vim-nox \
    git \
    ctags \
    libc6-dev \
    make \
    procps \
    indent \
    man-db \
    tree \
    openssh-client \
    htop \
    clang \
    libclang-dev \
    manpages-dev \
    tmux

ENV HOME /root
ENV TERM xterm-256color

COPY . /root/.dotfiles

RUN ln -s /root/.dotfiles/vim /root/.vim && ln -s /root/.dotfiles/vimrc /root/.vimrc && \
    ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf && \
    ln -s /root/.dotfiles/git/gitconfig /root/.gitconfig && \
    ln -s /root/.dotfiles/git/gitignore_global /root/.gitignore_global && \
    ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks && \
    mkdir -p /root/.ssh && \
    ln -s /root/.dotfiles/sshconf  /root/.ssh/config && \
    ln -s /.dockerinit /usr/local/bin/docker && \
    ln -s /usr/src/go /root/go && \
    rm /root/.bashrc && ln -s /root/.dotfiles/bashrc /root/.bashrc

WORKDIR /root
CMD ["tmux"]
