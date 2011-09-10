"Michael Crosby crosbymichael.com
syntax on
set number
colorscheme desert
set tabstop=4
set shiftwidth=4
set nocompatible


"additoins
set title
set wildmenu
set completeopt=menuone,longest,preview
set ruler
set cursorline


""for indentions
set smartindent
set autoindent
set expandtab

"For autocomplete
"
autocmd BufEnter * :syntax sync fromstart

filetype plugin on

" Python
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
