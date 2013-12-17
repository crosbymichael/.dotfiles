FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y
ENV USER_NAME michael

RUN apt-get install -y \
    gcc \
    g++ \
    build-essential \
    make \
    automake \
    python \
    python-dev \
    libc6-dev \
    autoconf \
    bison \
    cpp \
    gawk \
    gettext \
    libncurses5-dev \
    mercurial \
    git-core \
    lxc \
    aufs-tools  \
    libbz2-dev \
    libreadline-dev \
    wget \
    iotop \
    nmap \
    curl \
    socat \
    tmux \
    htop \
    gdb \
    tcpflow \
    ranger \
    ctags \
    tree \
    mosh \
    sysstat 

RUN mkdir -p /home/michael
# Cloning the repo to take advantage of the cache
RUN cd /home/michael && git clone https://github.com/crosbymichael/.dotfiles.git
RUN cd /home/michael/.dotfiles && git submodule update --init
ENV UPDATED 12_05_2013
RUN ./home/michael/.dotfiles/bootstrap.sh

RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# Password is root because I live on the edge
RUN adduser --disabled-password --gecos "" michael
RUN echo "root\nroot\n" | passwd michael
RUN chsh -s /usr/local/bin/fish michael
RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN chown -R michael:michael /home/michael

EXPOSE 22
ENTRYPOINT /usr/sbin/sshd -D
