export PATH=/usr/local/bin:$HOME/.dotfiles/bin/:$PATH

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
alias gsl='git stash list'
alias gsa='git stash apply'
alias gpu='git pull'
alias gpuo='git pull origin'

#Tar aliases 
alias ztar='tar -zcvf'
alias uztar='tar -zxvf'

#Cmd line aliases
alias cd..='cd ..'
alias lsa='ls -la'
alias cl='clear'
alias md='mkdir'
alias rd='rmdir'
alias ls='ls -l'

alias pbc='pbcopy'
alias pbp='pbpaste'

#todotxt aliases
alias tol='todo ls'
alias toa='todo a'
alias tod='todo do'

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
echo "-----------------------------------------------"
uptime
echo "-----------------------------------------------"
df -hl
echo "-----------------------------------------------"
echo "Up coming events:"
echo "-----------------"
CommandLineAssistant
echo "-----------------------------------------------"
echo "Todo Tasks:"
echo "-----------"
todo list
echo ""
