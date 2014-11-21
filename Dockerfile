FROM debian:jessie

WORKDIR /root
ENV TERM xterm-256color

RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
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
    build-essential \
    mercurial \
    valgrind \
    tmux

COPY . /root/.dotfiles

RUN cd .dotfiles && make golang home

CMD ["tmux"]
