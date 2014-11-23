## .dotfiles

These files bootstrap my development setup.
The `bashrc` and `vimrc` files are portable on Linux and OSX.

### base.sh

The `base.sh` file can be cat'd over SSH to a fresh server to setup the 
base system.  It installs docker, tmux, git, and that is about it.  This
base install is suitable for both servers and development setups.  


### dev.sh

The `dev.sh` file is used to bootstrap my development setup inside
the current users `$HOME` dir.  This will install any development 
tools along with the lastest version of Go.  After the tools are
installed it will symlink my configuration files from the repo
into the home dir so that tmux, bash, vim, and git are all setup.

### post-install.sh

The `post-install.sh` file is used to install some extra dependencies
after the `dev.sh` bootstrap step.  This includes Go binaries 
and extra things that require the development environment.

## Note!!!

This repository uses git submodules for many of the vim plugins.
Use `git submodules update --init` to pull down the correct
deps for the submodules.
