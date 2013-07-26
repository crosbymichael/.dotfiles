
all:

font:
	mkdir /usr/local/share/fonts/crosbymichael
	cp ~/.dotfiles/fonts/*.ttf /usr/local/share/fonts/crosbymichael/
	sudo chown -r root /usr/local/share/fonts/
	fc-cache

install:
	git submodule update --init --recursive
	ln -s ~/.dotfiles/vim ~/.vim
	ln -s ~/.dotfiles/vimrc ~/.vimrc
	ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
	ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global
	ln -s ~/.dotfiles/zshrc ~/.zshrc
	ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
	cp ~/.dotfiles/themes/* ~/.oh-my-zsh/themes
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh && ./install.sh
	
.PHONY: all install font
