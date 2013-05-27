
all:

go:
	go build bin/*.go

install:
	ln -s $HOME/.dotfiles/vim $HOME/.vim
	ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
	ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
	ln -s $HOME/.dotfiles/git/gitignore_global $HOME/.gitignore_global
	ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc


.PHONY: all go install
