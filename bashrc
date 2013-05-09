
export PATH=/usr/local/heroku/bin:/usr/local/bin:$HOME/.dotfiles/bin:$HOME/.local/bin:$HOME/.pypy/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$HOME/.local/depot_tools
export PATH=/usr/local/bin:$HOME/.dotfiles/bin:$HOME/.local/bin:$HOME/.local/pypy/bin:$HOME/go/bin:$HOME/gocode/bin:$PATH
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
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH

alias buildall='go build . ./...'
alias installall='go install . ./...'

export GOBIN=$HOME/go/bin

#OSX specific config
case `uname` in
    Darwin)
    export PKG_CONFIG_PATH=/usr/local/Cellar/sqlite/3.7.16.1/lib/pkgconfig:$PKG_CONFIG_PATH
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    alias sublime='open -a "Sublime Text 2"'
    alias pbc='pbcopy'
    alias pbp='pbpaste'
    ;;
    Linux)
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
    [ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
    HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
    shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
    HISTSIZE=1000
    HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
    shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

# set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color) color_prompt=yes;;
    esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

    if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
        else
        color_prompt=
        fi
    fi

    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
    esac

# enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

# some more ls aliases
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi
    ;;
esac

cat $HOME/.dotfiles/shark.txt
