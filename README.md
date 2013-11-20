This is my complete dotfile setup for my development box.  It works on OSX but must of the features 
are for Linux.  My linux install is a base Ubuntu 13.10 Server with only SSH Server selected
during the install.

Look at the `bootstrap.sh` script to see how the development environment is setup.

### Bootstrapping the install
Make sure you can ssh into your fresh install of Ubuntu and run this command.  
The argument to init.sh is the user's name that you want the dotfiles to be installed to.

```bash
ssh michael@xxx wget https://raw.github.com/crosbymichael/.dotfiles/master/init.sh && chmod +x init.sh && sudo ./init.sh michael
```


