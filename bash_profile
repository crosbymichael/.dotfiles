export PATH=/usr/local/bin:$HOME/.dotfiles/bin:/usr/local/go/bin:$PATH
export GOBIN=/usr/local/go/bin

#git aliases
alias gs='git status'
alias gmt='git mergetool'
alias gc='git commit'
alias gca='git commit -a'
alias gb='git branch'
alias gpo='git push origin'
alias gaa='git add .'
alias gco='git checkout'
alias glg='git log --graph --stat --oneline --decorate'
alias gl='git log --graph --oneline --decorate'
alias gm='git merge --no-ff'
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
alias 7za='7z a'

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

#Openssl Encryption
alias encrypt='openssl aes-256-cbc -a -salt '
alias decrypt='openssl aes-256-cbc -d -a '

alias markdown='markdown_py'

alias search='mdfind -onlyin /'

echo "-----------------------------------------------"
uptime
echo "-----------------------------------------------"
df -hl
echo "-----------------------------------------------"
echo "Up coming events:"
echo "-----------------"
tCal -d 7
echo "-----------------------------------------------"
echo "Todo Tasks:"
echo "-----------"
todo list
echo ""
