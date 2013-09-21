"Michael Crosby crosbymichael.com

call pathogen#infect()

syntax on
set number
set tabstop=4
set shiftwidth=4
set nocompatible
set guifont=Ubuntu\ Mono:s14

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Linux\n"
    set backspace=2
  endif
endif

autocmd! bufwritepost .vimrc source %
set pastetoggle=<F2>
set clipboard=unnamed
set nobackup
set nowritebackup
set noswapfile
au InsertLeave * set nopaste

"additoins
"set title
set wildmenu
set completeopt=longest,menuone
set ruler
set cursorline

set hlsearch
set incsearch
set showmatch

"for indentions
set smartindent
set autoindent
set expandtab
filetype plugin indent on

"Code folding fold with za
set foldmethod=indent
set nofoldenable

"For autocomplete
autocmd BufEnter * :syntax sync fromstart
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"Pugins
filetype on
filetype plugin on

" Python
" ----------------------------------
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

au BufRead *.go set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Objective C 
au BufNewFile, BufRead *.m, *.h set ft=objc

" Set Arduino dictionary word list
au FileType arduino set dictionary=~/.vim/dicts/arduinowords

"key mappings
"----------------------------
"Pane movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Resize panes with the mouse and select text
set mouse=a

"Move lines up and down
nnoremap m2<cr> :m+2
nnoremap m1<cr> :m+
nnoremap m-2<cr> :m-2

"NerdTree Toggle
nnoremap <F2> :NERDTreeToggle<CR>

"Ctags toggle
nnoremap <F3> :TagbarToggle<CR>

"Tabman
nmap <F4> :TMToggle<CR>

map <F6> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

"Generate ctags
nnoremap <F8> :!/opt/local/bin/ctags -R --python-kinds=-i *.py<CR>

"OmniComplete
inoremap <Nul> <C-x><C-o>

"Shortcuts
abbrev chrome :! open -a google\ chrome.app %:p<cr>
abbrev spell setlocal spell spelllang=en_us<CR>

" go fmt on save
autocmd BufWritePre *.go Fmt

" Start NERDTree on startup
" autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w

" Go Run
map <buffer> <S-e> :w<CR>:!go run % <CR>
map <buffer> <S-b> :w<CR>:!go build % <CR>
abbrev gobi :!go build -v . ./... && go install . ./...<CR>

"let g:script_runner_go = 'go run %:p'

" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>

" " For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

"For a better popup
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

set background=light
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" javascript indent
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType go set omnifunc=gocomplete#Complete

let g:godef_split = 0

" highlight chars past 80 cols
match ErrorMsg '\%>80v.\+'

" Vim Ctrl - P 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

" Tagbar with go tags
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

