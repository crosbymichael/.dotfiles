##Changes
Added my cron tab for osx to the cron folder

Added setup scripts to system link the dotfiles configs to your home dir.  Make sure you backup and remove the files in the setup scripts before running them or it will not work.  

##Automation
Rsync to USB drive
Rsync to server for projects
Gmail backups

Prereq
---
port install ctags

Compile vim for python

For web.py
easy_install web

Add .dotfiles/bin to your PATH

Commandline Apps
---
Commandline Assistant
* Quickly see today and tomorrows events from your ical

Boom

irssi

todotxt

vim 

quicktest
* Quickly test GET and POST request with a fast python webserver that echos back data passed

VIM Plugins
---
ctags

pyflakes

NERDTree

Python Omnicomplete

GoCode

Go Syntax

Tasklist

SnipMate

Cocoa docs and codecompletion

fugitive Git Plugin

vim auto complete popup

HowTo
---
:TlistToggle
:NERDTreeToggle
:helptags ~/.vim/doc/

System links
---
ln -s ~/.dotfiles/git/gitconfig .gitconfig

ln -s ~/.dotfiles/vimrc .vimrc

ln -s ~/.dotfiles/vim .vim

ln -s ~/.dofiles/todotxt/todo.cfg todo.cfg
