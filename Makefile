
all:

# Build the bin go files so that they work on different platforms
# and the repository stays small
go:
	go get -u github.com/golang/lint/golint
	go get -u github.com/jingweno/gh
	go get -u github.com/nsf/gocode
	go get -u github.com/jstemmer/gotags
	go get -u github.com/axw/gocov/gocov
	go build -o bin/server bin/server.go

init:
	git submodule update --init --recursive

font:
	mkdir /usr/local/share/fonts/crosbymichael
	cp ~/.dotfiles/fonts/*.ttf /usr/local/share/fonts/crosbymichael/
	sudo chown -r root /usr/local/share/fonts/
	fc-cache

.PHONY: all go init font
