## .dotfiles

This is my complete development environment for [Go](http://golang.org) and [Docker](http://docker.io) 
development.  It can be easily bootstrapped by running `init.sh` on a debian based system.  I use the Ubuntu 13.10 mini install.

You can get the full development environment in a docker container by running:

```bash
docker pull crosbymichael/dotfiles
docker run -t -i -v /var/run/docker.sock:/var/run/docker.sock crosbymichael/dotfiles
```
