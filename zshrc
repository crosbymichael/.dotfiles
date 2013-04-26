# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/heroku/bin:/usr/local/bin:/Users/michael/.dotfiles/bin:/Users/michael/.local/bin:/Users/michael/.pypy/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin
export PATH=/usr/local/bin:$HOME/.dotfiles/bin:$HOME/.local/bin:$HOME/.local/pypy/bin:$HOME/go/bin:$HOME/gocode/bin:$PATH
export BETTER_TODO_LIST=$HOME/Dropbox/better-todo.md
export GOROOT=$HOME/go
export GOPATH=$HOME/gocode

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

alias sublime='open -a "Sublime Text 2"'
alias pbc='pbcopy'
alias pbp='pbpaste'

alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

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
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PKG_CONFIG_PATH=/usr/local/Cellar/sqlite/3.7.16.1/lib/pkgconfig:/Users/michael/.local/lib/pkgconfig:$PKG_CONFIG_PATH
alias buildall='go build . ./...'
alias installall='go install . ./...'

export GOBIN=$HOME/go/bin
