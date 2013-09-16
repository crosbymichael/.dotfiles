DISABLE_AUTO_TITLE=true
ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_THEME="cm"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

plugins=(git virtualenv python golang vagrant brew tmux docker)

source $ZSH/oh-my-zsh.sh

# -------------------------------------- #
# --------------Exports----------------- #

path=(
    $path
    ~/development/gocode/bin
    ~/development/gocode/src/github.com/dotcloud/docker/docker
    /usr/local/heroku/bin
    /usr/local/bin
    /usr/local/go/bin
    ~/.dotfiles/bin
    /usr/bin
    /bin
    /usr/sbin
    /sbin
    /opt/X11/bin
    ~/.local/depot_tools
)

export GOROOT=/usr/local/go
export GOPATH=$HOME/development/gocode
export GOBIN=/usr/local/go/bin
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$HOME/.local/lib

# -------------------------------------- #
# --------------Aliases----------------- #

alias gs='git status -u'
alias gmt='git mergetool'
alias gc='git commit'
alias gca='git commit -a'
alias gb='git branch -v -v'
alias gaa='git add .'
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

alias pychecker='pychecker -L 50 -R 4 -J 6 '
alias markdown='markdown_py'
alias createenv='virtualenv --no-site-packages '

alias godebug='go build -gcflags "-N -l"'
alias godocserver='godoc -http=:8111'
alias buildall='go build -v . ./...'
alias installall='go install . ./...'
alias gobi='buildall && installall'

alias up='vagrant up'
alias noup='vagrant up --no-provision'
alias down='vagrant halt'

alias attach='tmux attach-session -t 0'

# Iptables
alias iptbleshow='iptables -L -n -t nat'

# ---------------OSX------------------- #

case `uname` in
    Darwin)
    export PKG_CONFIG_PATH=/usr/local/Cellar/sqlite/3.7.16.1/lib/pkgconfig:$PKG_CONFIG_PATH
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    alias sublime='open -a "Sublime Text 2"'
    alias pbc='pbcopy'
    alias pbp='pbpaste'
    alias search='mdfind -onlyin .'
    alias lsa='ls -lah'
    alias ls='ls -lh'
    ;;
    Linux)
    export LC_ALL="UTF8",
    export LC_CTYPE="en_US.UTF-8",
    export LANG="en_US.UTF-8"
    alias lsa='ls -lah --color=auto'
    alias ls='ls -lh --color=auto'
    ;;
esac

setopt no_share_history

# ----------------Scripts-------------------#
# Marks http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump { 
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark { 
    rm -i $MARKPATH/$1 
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

