This is my complete dotfile setup for my development box.  It works on OSX but must of the features 
are for Linux.  My linux install is a base Ubuntu 12.04 Server with only SSH Server selected
during the install.

Look at the `bootstrap.sh` script to see how the development envionment is setup.

### Bootstrapping the install
Make sure you can ssh into your fresh install of ubuntu and run this command.  
The argument to init.sh is the user's name that you want the dotfiles to be installed to.

```bash
ssh michael@xxx wget https://raw.github.com/crosbymichael/.dotfiles/master/init.sh && chmod +x init.sh && sudo ./init.sh michael
```

After the install is complete you will have my full development envinronment setup.


## Vim Plugins:
* Pathogen
* Golang
* tabbar
* snipmate
* tasklist
* nerd tree
* fugitive
* pydoc
* Lots of themes
* Coffeescript
* Typescript
* less
* puppet
* markdown
* gitgutter
* html5

## Dev:
* Gocode
* gdb
* zeroMQ
* pip
* virtualenv

## Apt Packages

## Go Binary Packages


## Go Packages


