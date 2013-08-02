
all:

# Build the bin go files so that they work on different platforms
# and the repository stays small
go:
	go get github.com/golang/lint/golint
	go get github.com/nsf/gocode
	go get github.com/dotcloud/docker
	go build -o bin/server bin/server.go

init:
	git submodule update --init --recursive

font:
	mkdir /usr/local/share/fonts/crosbymichael
	cp ~/.dotfiles/fonts/*.ttf /usr/local/share/fonts/crosbymichael/
	sudo chown -r root /usr/local/share/fonts/
	fc-cache

.PHONY: all go init font
