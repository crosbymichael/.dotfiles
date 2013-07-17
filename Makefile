
all:

# Build the bin go files so that they work on different platforms
# and the repository stays small
go:
	go build -o bin/server bin/server.go

python:
	install/python.sh

init:
	git submodule update --init --recursive

update:
	git pull origin master
	init
	go

font:
	mkdir /usr/local/share/fonts/crosbymichael
	cp ~/.dotfiles/fonts/*.ttf /usr/local/share/fonts/crosbymichael/
	sudo chown -r root /usr/local/share/fonts/
	fc-cache

compile:

zsh:
	cp ~/.dotfiles/themes/* ~/.oh-my-zsh/themes

# Install the dot files via sys links
install:
	ln -s ~/.dotfiles/vim ~/.vim
	ln -s ~/.dotfiles/vimrc ~/.vimrc
	ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
	ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global
	ln -s ~/.dotfiles/zshrc ~/.zshrc
	ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

.PHONY: all go install init update python font compile
