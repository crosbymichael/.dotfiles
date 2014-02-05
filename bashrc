
# -------------------------------------- #
# --------------Functions----------------- #
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

HISTSIZE=10000
PROMPT_COMMAND='printf "\033k%s@%s:%s\033\\" "${PWD/#$HOME/~}"'
PS1="\\w\$(parse_git_branch '(%s)') \$ "

# setup path and env vars
export PATH=$PATH:$HOME/.dotfiles/bin:/root/go/bin
export GOROOT=/root/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/development/gocode

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
alias resetmaster='git fetch --all && git reset --hard origin/master'
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

alias pychecker='pychecker -L 50 -R 4 -J 6 '
alias markdown='markdown_py'
alias createenv='virtualenv --no-site-packages '

alias godebug='go build -gcflags "-N -l"'
alias godocserver='godoc -http=:8111'
alias buildall='go build -v . ./...'
alias installall='go install . ./...'
alias gobi='go build -v . ./... && go install . ./...'

alias attach='tmux attach-session -t 0'
alias listinstalled='dpkg --get-selections'

# Iptables
alias iptbleshow='iptables -L -n -t nat'

alias lsa='ls -lah --color=auto'
alias ls='ls -lh --color=auto'

