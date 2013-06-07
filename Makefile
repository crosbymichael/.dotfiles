
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
	cp $HOME/.dotfiles/fonts/*.ttf /usr/local/share/fonts/crosbymichael/
	sudo chown -r root /usr/local/share/fonts/
	fc-cache

# Install the dot files via sys links
install:
	ln -s $HOME/.dotfiles/vim $HOME/.vim
	ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
	ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
	ln -s $HOME/.dotfiles/git/gitignore_global $HOME/.gitignore_global
	ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
	ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf

.PHONY: all go install init update python font
