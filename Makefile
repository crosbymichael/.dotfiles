
all:

# Build the bin go files so that they work on different platforms
# and the repository stays small
go:
	go build -o bin/server bin/server.go

# Install the dot files via sys links
install:
	ln -s $HOME/.dotfiles/vim $HOME/.vim
	ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
	ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
	ln -s $HOME/.dotfiles/git/gitignore_global $HOME/.gitignore_global
	ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

.PHONY: all go install
