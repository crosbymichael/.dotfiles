export CROSBY=$HOME/Projects/crosbymichael
export OPENSOURCE=$HOME/Projects/opensource

export PATH=$PATH:$HOME/go/bin/:$HOME/.dotfiles/bin/
export GOBIN=$HOME/go/bin/
export GOROOT=$HOME/go/
export GOOS=darwin
export GOARCH=amd64

#git aliases
alias gs='git status'
alias gmt='git mergetool'
alias gc='git commit'
alias gca='git commit -a'
alias gb='git branch'
alias gpo='git push origin'
alias gaa='git add .'
alias gco='git checkout'
alias glg='git log --graph'
alias gl='git log'
alias gm='git merge'
alias gtk='gitk'
alias gcl='git clone'
alias gp='git push'
alias gd='git diff'

#Tar aliases 
alias ztar='tar -zcvf'
alias uztar='tar -zxvf'

#Cmd line aliases
alias cd..='cd ..'
alias lsa='ls -la'
alias cl='clear'
alias md='mkdir'
alias rd='rmdir'

#todotxt aliases
alias tol='todo ls'
alias toa='todo a'
alias tod='todo do'

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

##
# Your previous /Users/michael/.bash_profile file was backed up as /Users/michael/.bash_profile.macports-saved_2011-09-10_at_22:18:22
##

# MacPorts Installer addition on 2011-09-10_at_22:18:22: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
