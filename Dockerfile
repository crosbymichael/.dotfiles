FROM crosbymichael/golang

RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    vim \
    git \
    ctags \
    libc6-dev \
    make \
    man-db \
    fish \
    procps \
    locales \
    tree \
    tmux && \
    dpkg-reconfigure locales && locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8 && \
    chsh -s /usr/bin/fish

ENV HOME /root
ENV LC_ALL C.UTF-8
ENV TERM xterm-256color

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
CMD []
