# @crosbymichael

switch (uname)
    case Linux
       set -x DOCKER_HOST unix:///var/run/docker.sock
       alias lsa='ls -lah --color=auto'
       alias ls='ls -lh --color=auto'
       alias iptbleshow='iptables -L -n -t nat'
    case Darwin
        set -x DOCKER_HOST tcp://docker:4243
        set -x CLICOLOR 1
        set -x LSCOLORS gxBxhxDxfxhxhxhxhxcxcx
        alias lsa='ls -lah'
        alias ls='ls -lh'
end

set -x EDITOR vim

set -x GOROOT $HOME/go
set -x GOBIN $GOROOT/bin
set -x GOPATH $HOME/development/gocode

set PATH $HOME/go/bin $PATH;
set PATH $HOME/.dotfiles/bin $PATH;
set PATH $GOBIN $PATH
set PATH /usr/sbin $PATH;

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
alias resetmaster='git fetch origin; and git reset --hard origin/master'
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
alias gobi='go build -v . ./...; and go install . ./...'
alias attach='tmux attach-session -t 0'
alias tree='tree -F'

# --------------Functions----------------- #
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  set -l cwd $cyan(basename (prompt_pwd))

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    set git_info "$green$git_branch "

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow✗"
      set git_info "$git_info$dirty"
    end
  end

  echo -n -s $cwd $red '|' $git_info $normal ⇒ ' ' $normal
end

function run_docker
    docker run -ti --rm --privileged -v $HOME/docker:/go/src/github.com/dotcloud/docker docker bash 
end

function remove_images_none 
    docker rmi (docker images | grep "<none>" | awk '{print $3}')
end

function clean_merged_branches
    git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
end
