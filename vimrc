set shell=/bin/bash

call pathogen#infect()

" ---------------- SETTINGS ----------------
syntax on
colorscheme github
autocmd! bufwritepost .vimrc source %

" platform specific settings
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Linux\n"
    set backspace=2
    autocmd BufWritePre *.c,*.h Cfmt
    let g:clang_library_path='/usr/lib/llvm-3.5/lib'
  endif
  if s:uname == "Darwin\n"
    let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
  endif
endif

set number
set tabstop=4
set shiftwidth=4
set nocompatible
set pastetoggle=<F2>
set nobackup
set nowritebackup
set noswapfile
set wildmenu
set ruler
set cursorline
set hlsearch
set incsearch
set showmatch
set smartindent
set autoindent
set expandtab
set nofoldenable
set t_Co=256
set foldmethod=indent
set clipboard=unnamed
set completeopt=menuone,longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

filetype on
filetype plugin on
filetype plugin indent on
au InsertLeave * set nopaste

autocmd BufEnter * :syntax sync fromstart
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd BufWritePre *.go Fmt
autocmd FileType go set omnifunc=gocomplete#Complete
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w
abbrev spell setlocal spell spelllang=en_us<CR>

" ---------------- KEY BINDINGS ----------------
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap m2<cr> :m+2
nnoremap m1<cr> :m+
nnoremap m-2<cr> :m-2
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :TagbarToggle<CR>
inoremap <Nul> <C-x><C-o>
" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
"For a better popup
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" ---------------- PLUGIN SETTINGS ----------------
let g:clang_make_default_keymappings = 0
let g:godef_split = 1
let g:cfmt_style = '-linux'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" ---------------- EXTRA FUNCTIONS ----------------

