HISTSIZE=500000

# ---------------------- GLOBAL -------------------------
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# ---------------------- PROMPT -------------------------
C_NONE='\[\033[0m\]'
C_RED='\[\033[0;31m\]'
C_GREEN='\[\033[0;32m\]'
C_BLUE='\[\033[0;34m\]'
C_YELLOW='\[\033[1;33m\]'
C_WHITE='\[\033[1;37m\]'
C_BOLD='\[\e[1;91m\]'

function parse_git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

PS1="$C_GREEN\u$C_RED|$C_WHITE\w$C_BLUE >$C_NONE "

# ---------------------- PLATFORM SPECIFIC SETTINGS -------------------------
case $(uname) in
    Linux)
        alias lsa='ls -lah --color=auto'
        alias ls='ls -lh --color=auto'
        alias iptbleshow='iptables -L -n -t nat'
        alias bcopy='xclip -i -sel clip'
        alias bpaste='xclip -o -sel clip'
        ;;
    Darwin)
        export DOCKER_HOST=tcp://docker:2375
        export CLICOLOR=1
        export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
        alias lsa='ls -lah'
        alias ls='ls -lh'
        ;;
esac

# ---------------------- ENVIRONMENT -------------------------
export EDITOR=vim
export GOROOT=$HOME/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/development/gocode
export PIPBIN=/home/michael/.local/bin
export PATH=$PATH:$GOBIN:$PIPBIN
export GO15VENDOREXPERIMENT=1
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
# export BUILDKIT=development.compute:9500

# ---------------------- ALIAS -------------------------
alias tmux="TERM=xterm-256color tmux"
alias gs='git status -u'
alias gc='git commit'
alias gca='git commit -a'
alias gcs='git commit -as'
alias gb='git branch -v -v'
alias gbd='git branch -d'
alias gaa='git add -A'
alias gco='git checkout'
alias glg='git log --graph --stat --oneline --decorate'
alias gl='git log --graph --oneline --decorate'
alias gm='git merge --no-ff'
alias gcl='git clone'
alias gpo='git push origin'
alias gp='git push'
alias gd='git diff'
alias cd..='cd ..'
alias cl='clear'
alias tree='tree -F'
alias tre='tree -F -L 1'
alias curl='curl -s'
alias tarl='tar -tvf'
alias newwork='tmux new -s docker'
alias newmine='tmux new -s me'
alias work='tmux a -t docker'
alias mine='tmux a -t me'

# ---------------------- FUNCTIONS -------------------------
function reset_master() {
    git checkout master
    git fetch origin && git reset --hard origin/master
}

function remove_images_none() {
    docker rmi $(docker images | grep "<none>" | awk '{print $3}')
}

function clean_merged_branches() {
    git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

function hash_dir() {
    find . -type f -o -type d  | cpio -o  | sha1sum
}

function linecount() {
    find . -name "*.$1" | xargs wc -l
}

function find_replace() {
    pt -l "$1" | xargs perl -pi -E "s/$1/$2/g"
}

function git_winner() {
    git ls-tree --name-only -z -r HEAD|egrep -z -Z -E '\.(go)$' \
       |xargs -0 -n1 git blame --line-porcelain|grep "^author "|sort|uniq -c|sort -nr
}

function setuid_create() {
    sudo chown root:root "$1"
    sudo chmod 4755 "$1"
}

function go_all() {
    go build -v . ./...
    go build -v ./...
    go install . ./...
    go install ./...
}

function go_cover() {
    go test -cover -coverprofile /dev/stderr 2>&1 >/dev/null | go tool cover -func /dev/stdin
}

function go_doc() {
    godoc -http="localhost:6060"
}

function tunnel() {
    ssh $1 -L "$2:$3" -N
}

# show all installed packages on a debian based system
function installed_packages() {
    dpkg --get-selections | grep -v deinstall
}

function git_undo() {
    git reset --soft HEAD^
}

function gpgtty() {
    export GPG_TTY=$(tty) $*
}

function getmysshkey() {
    cat ~/.ssh/id_rsa.pub | bcopy
}

function ghead () {
	git rev-parse HEAD
}

function gitk() {
	mkdir -p $1
	touch "$1/.gitkeep"
}

function dind() {
	ctr -n buildkit run --privileged --rm -t --mount "type=bind,options=rbind:rw,src=$(pwd),dst=/go/src/github.com/docker/docker" docker-build docker-shell bash
}
