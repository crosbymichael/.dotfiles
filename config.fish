
# Customize to your needs...
set -x PATH=/usr/local/heroku/bin:/usr/local/bin:$HOME/.dotfiles/bin:$HOME/.local/bin:$HOME/.pypy/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$HOME/.local/depot_tools
set -x PATH=/usr/local/bin:$HOME/.dotfiles/bin:$HOME/.local/bin:$HOME/.local/pypy/bin:$HOME/go/bin:$HOME/gocode/bin:$PATH
set -x GOROOT=$HOME/go
set -x GOPATH=$HOME/gocode

#git aliases
alias gs='git status'
alias gmt='git mergetool'
alias gc='git commit'
alias gca='git commit -a'
alias gb='git branch'
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
alias grls='git remote -v'
alias clone='git clone'

#Tar aliases
alias ztar='tar -zcvf'
alias uztar='tar -zxvf'
alias 7za='7z a'

#Cmd line aliases
alias cd..='cd ..'
alias lsa='ls -lahG'
alias cl='clear'
alias md='mkdir'
alias rd='rmdir'
alias ls='ls -lhG'

#todotxt aliases
alias tol='todo ls'
alias toa='todo a'
alias tod='todo do'

#Openssl Encryption
alias encrypt='openssl aes-256-cbc -a -salt '
alias decrypt='openssl aes-256-cbc -d -a '

#Python
alias pychecker='pychecker -L 50 -R 4 -J 6 '
alias markdown='markdown_py'
alias createenv='virtualenv --no-site-packages '

#Spotlight search
alias search='mdfind -onlyin /'

#Golang
alias godebug='go build -gcflags "-N -l"'
alias godocserver='godoc -http=:8111'

##Colors
set -x CLICOLOR=1
set -x LSCOLORS=GxFxCxDxBxegedabagaced
set -x PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH

alias buildall='go build . ./...'
alias installall='go install . ./...'

set -x GOBIN=$HOME/go/bin

set ostype (uname)
#OSX specific config
switch $ostype
    case Darwin
        set -x PKG_CONFIG_PATH=/usr/local/Cellar/sqlite/3.7.16.1/lib/pkgconfig:$PKG_CONFIG_PATH
        alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
        alias sublime='open -a "Sublime Text 2"'
        alias pbc='pbcopy'
        alias pbp='pbpaste'
end

cat $HOME/.dotfiles/shark.txt
