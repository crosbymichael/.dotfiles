## .dotfiles

This repo holds all my configuration for my development environment and prod servers.  It supports both linux and OSX.  The development env is best used inside a container via the Dockerfile. 

You can get the full development environment in a docker container by running:

```bash
docker pull crosbymichael/dotfiles

docker run -ti --name development \
    -v $HOME/docker:/root/docker \
    -v /var/run/docker.sock:/var/run/docker.sock \
    crosbymichael/dotfiles
```

### Tools:
* tig
* git
* vim
* docker 
* platinum searcher
* tmux
* curl
* go
