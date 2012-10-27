export PATH=/usr/local/bin:$HOME/.dotfiles/bin:$HOME/.local:$PATH
export BETTER_TODO_LIST=$HOME/Dropbox/better-todo.md

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
alias lsa='ls -lah'
alias cl='clear'
alias md='mkdir'
alias rd='rmdir'
alias ls='ls -lh'

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

#Fabric
alias gripe='fab -f ~/fabric/gripe.py'

#Spotlight search
alias search='mdfind -onlyin /'

echo "-----------------------------------------------"
uptime
echo "-----------------------------------------------"
df -hl
echo "-----------------------------------------------"
echo "Up coming events:"
echo "-----------------"
tCal -d 7
echo ""
