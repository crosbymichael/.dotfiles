HISTSIZE=10000

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


PS1='\[\033[0;32m\]\u\[\033[0;31m\]|\[\033[1;37m\]\w\[\033[0m\]> '

case $(uname) in
    Linux)
        alias lsa='ls -lah --color=auto'
        alias ls='ls -lh --color=auto'
        alias iptbleshow='iptables -L -n -t nat'
        ;;
    Darwin)
        export DOCKER_HOST=tcp://docker:2375
        export CLICOLOR=1
        export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
        alias lsa='ls -lah'
        alias ls='ls -lh'
        ;;
esac

export EDITOR=vim
export GOROOT=$HOME/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/development/gocode

export PATH=$PATH:$HOME/.dotfiles/bin:$GOBIN

# --------------Aliases----------------- #
alias gs='git status -u'
alias gmt='git mergetool'
alias gc='git commit'
alias gca='git commit -a'
alias gcs='git commit -as'
alias gb='git branch -v -v'
alias gaa='git add -A'
alias gco='git checkout'
alias glg='git log --graph --stat --oneline --decorate'
alias gl='git log --graph --oneline --decorate'
alias gm='git merge --no-ff'
alias gtk='gitk'
alias gcl='git clone'
alias gpo='git push origin'
alias gp='git push'
alias gd='git diff'
alias gsl='git stash list'
alias gsa='git stash apply'
alias gpull='git pull'
alias gpullo='git pull origin'
alias gremotes='git remote -v'
alias gcount='git count-objects -H'
alias addlast='git commit --amend –C HEAD'
alias gcount='git fetch --all'
alias resetmaster='git fetch origin && git reset --hard origin/master'
alias gls='git stash list'

alias ztar='tar -zcvf'
alias uztar='tar -zxvf'
alias lstar='tar -ztvf'
alias 7za='7z a'
alias cd..='cd ..'
alias cl='clear'
alias md='mkdir'
alias rd='rmdir'
alias back='popd'

alias encrypt='openssl aes-256-cbc -a -salt '
alias decrypt='openssl aes-256-cbc -d -a '

alias godebug='go build -gcflags "-N -l"'
alias godocserver='godoc -http=:8111'
alias buildall='go build -v . ./...'
alias installall='go install . ./...'
alias gobi='go build -v . ./... && go install . ./...'
alias attach='tmux attach-session -t 0'
alias tree='tree -F'

function run_docker() {
    docker run -ti --rm --privileged -v $HOME/docker:/go/src/github.com/dotcloud/docker docker bash 
}

function remove_images_none() {
    docker rmi $(docker images | grep "<none>" | awk '{print $3}')
}

function clean_merged_branches() {
    git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

function go_linux() {
    export GOOS=linux
    export GOARCH=amd64
}

function compile() {
    gcc -Wall -g --std gnu99 -O3 $@
}
