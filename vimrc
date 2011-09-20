"Michael Crosby crosbymichael.com
syntax on
set number
colorscheme delek
set tabstop=4
set shiftwidth=4
set nocompatible


"additoins
set title
set wildmenu
set completeopt=menuone,preview
set ruler
set cursorline

set hlsearch
set incsearch
set showmatch

""for indentions
set smartindent
set autoindent
set expandtab



set mouse=a

"For autocomplete
"
autocmd BufEnter * :syntax sync fromstart
filetype on
filetype plugin on

" Python
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

nnoremap scp<cr> :setlocal spell<cr>

nnoremap m2<cr> :m+2
nnoremap m1<cr> :m+
nnoremap m-2<cr> :m-2


"key mappings
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :Tlist<CR>
inoremap <Nul> <C-x><C-o>
nmap <F5> :call Run(&ft)<CR>
nnoremap <F8> :!/opt/local/bin/ctags -R --python-kinds=-i *.py<CR>
