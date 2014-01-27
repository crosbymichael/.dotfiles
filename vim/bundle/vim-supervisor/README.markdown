vim-supervisor
==============

supervisorctl wrapper in vim from anywhere inside your project. Manage your
processes from a fugitive-like control buffer, send SIGHUPs when saving your
files or view your logs from anywhere in your project.

Amazing features:

* Control buffer with syntax highlighting! Run `:Sstatus` and you will get a
  buffer with the current output of `supervisorctl status`. Each row has a few
  mappings relating to it's process: `R` will restart the service. `S` will start
  or stop it depending on it's current state. `o` will open the stdout log file
  and `e` will open the stderr file. If you have TailBundle installed, the logs
  will automatically tail.

* Quickfast editing! Run `:Sedit` to open your supervisord.conf file from
  anywhere in your project. Give it arguments and it will open files in the
  supervisord directory (e.g. `:Sedit include.d/doomsday_laser.conf`). Glorious
  tab completion is provided!

* Log management: `:Stail <app> <stream>` to open log and error files. As with
  opening them from the control buffer, if you have TailBundle, smooth tailing
  will take place.

* General wrapper: The `:Supervisor` command wraps around all the commands
  that supervisorctl usually handles. As always, tab completion is your friend!

Installation
------------

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and
then simply copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/thiderman/vim-supervisord.git

Once help tags have been generated, you can view the manual with
`:help supervisord`.

FAQ
---

> I installed the plugin and started vim.  Why does only the :Supervisor
> command exist?

This plugin will activate when it thinks it's inside a supervisord managed
application. That is, anywhere inside a directory that has a parent or a
sibling that contains a supervisord.conf file. Should your project be out of
scope for this, you can specify it with `g:supervisord_apps`. See
`:help supervisor-config`


Contributing
------------

If your [commit message sucks](http://stopwritingramblingcommitmessages.com/),
I'm not going to accept your pull request.  Tim Pope explained very politely
dozens of times that
[his general guidelines](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
are absolute rules on his repositories, and I agree with them and apply them to
my repositories as well.  And please, if I ask you to change something,
`git commit --amend`.

License
-------

Copyright (c) Lowe Thiderman.  Distributed under the same terms as Vim itself.
See `:help license`.
