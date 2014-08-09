FROM golang:1.3

RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    vim \
    git \
    ctags \
    libc6-dev \
    make \
    procps \
    indent \
    tree \
    openssh-client \
    htop \
    tmux

ENV HOME /root
ENV TERM xterm-256color

ADD . /root/.dotfiles

RUN ln -s /root/.dotfiles/vim /root/.vim && ln -s /root/.dotfiles/vimrc /root/.vimrc && \
    ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf && \
    ln -s /root/.dotfiles/git/gitconfig /root/.gitconfig && \
    ln -s /root/.dotfiles/git/gitignore_global /root/.gitignore_global && \
    ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks && \
    mkdir -p /root/.ssh && \
    ln -s /root/.dotfiles/sshconf  /root/.ssh/config && \
    ln -s /.dockerinit /usr/local/bin/docker && \
    ln -s /usr/local/go /root/go && \
    rm /root/.bashrc && ln -s /root/.dotfiles/bashrc /root/.bashrc


RUN /./root/.dotfiles/go-install.sh

WORKDIR /root
CMD ["tmux"]
