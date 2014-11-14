all:
	docker build -t crosbymichael/dotfiles .

host:
	apt-get update && apt-get upgrade -y && apt-get install -y \
		htop \
		curl \
		supervisor \
		cgroup-lite \
		aufs-tools

	curl -o /usr/local/bin/docker http://crosbymichael.com.s3.amazonaws.com/docker
	chmod +x /usr/local/bin/docker
	curl -o /etc/supervisor/conf.d/docker.conf https://raw.githubusercontent.com/crosbymichael/.dotfiles/master/docker.conf
	supervisorctl reload

golang:
	curl -sSL http://golang.org/dl/go1.3.1.src.tar.gz \
    | tar -v -C /root -xz
	cd /root/go/src && ./make.bash --no-clean 2>&1

tools:
	go get github.com/nsf/gocode
	go get github.com/rakyll/boom
	go get github.com/jstemmer/gotags
	go get code.google.com/p/rog-go/exp/cmd/godef
	go get code.google.com/p/go.tools/cmd/goimports
	go get github.com/monochromegane/the_platinum_searcher 
	go get github.com/golang/lint/golint
	go get code.google.com/p/go.tools/cmd/vet

dev:
	ln -s /root/.dotfiles/vim /root/.vim && ln -s /root/.dotfiles/vimrc /root/.vimrc && \
    ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf && \
    ln -s /root/.dotfiles/gitconfig /root/.gitconfig && \
    ln -s /root/.dotfiles/gitignore_global /root/.gitignore_global && \
    ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks && \
    mkdir -p /root/.ssh && ln -s /root/.dotfiles/sshconf  /root/.ssh/config && \
    rm /root/.bashrc && ln -s /root/.dotfiles/bashrc /root/.bashrc
	ln -s /root/development/gocode/src/github.com/docker/docker /root/docker
	ln -s /root/development/gocode/src/github.com/docker/libcontainer /root/libcontainer

run:
	docker run -ti --rm --name dev \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v /usr/local/bin/docker:/usr/local/bin/docker \
		-v /root/development:/root/development \
		-v /root/.ssh:/root/.ssh \
		crosbymichael/dotfiles
