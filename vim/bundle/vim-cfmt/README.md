# vim-cfmt

A vim plugin using 
[gnu indent](https://www.gnu.org/software/indent/manual/indent.html) 
to auto format C source code.

You will need to install `indent` on your system to use this plugin.
If you are on a debian based system you can use apt to install it.
```bash
apt-get install indent
```

Install using Pathogen or Vundle then set this in your `vimrc`:
```vimrc
autocmd BufWritePre *.c,*.h Cfmt
```

You can configure the style of formating by using the `g:cfmt_style` 
variable.

```vimrc
let g:cfmt_style = '-linux'
let g:cfmt_style = '-kr'
let g:cfmt_style = '-gnu'
```

### License

Distributed under the same terms as Vim itself. See `:help license`.
