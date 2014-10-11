set shell=/bin/bash

call pathogen#infect()

syntax on
set mouse=a
set number
set tabstop=4
set shiftwidth=4
set nocompatible

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Linux\n"
    set backspace=2
    autocmd BufWritePre *.c FmtC
    let g:clang_library_path='/usr/lib/llvm-3.4/lib'
  endif
endif

autocmd! bufwritepost .vimrc source %
set pastetoggle=<F2>
set clipboard=unnamed
set nobackup
set nowritebackup
set noswapfile
au InsertLeave * set nopaste

set wildmenu
set completeopt=menuone,longest
set ruler
set cursorline

set hlsearch
set incsearch
set showmatch

set smartindent
set autoindent
set expandtab
filetype plugin indent on

set foldmethod=indent
set nofoldenable

autocmd BufEnter * :syntax sync fromstart
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

filetype on
filetype plugin on

au BufRead *.rst setlocal expandtab shiftwidth=4 tabstop=8 smartindent

"Key Binding
"----------------------------
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap m2<cr> :m+2
nnoremap m1<cr> :m+
nnoremap m-2<cr> :m-2
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :TagbarToggle<CR>
nmap <K> :Godoc<CR>
nmap <F4> :TMToggle<CR>
map <F6> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
nnoremap <F8> :!/opt/local/bin/ctags -R --python-kinds=-i *.py<CR>
inoremap <Nul> <C-x><C-o>

abbrev spell setlocal spell spelllang=en_us<CR>

" auto format commands on save
autocmd BufWritePre *.go Fmt
autocmd BufWritePre *.html Autoformat html
autocmd BufWritePre *.js Autoformat js
autocmd BufWritePre *.css Autoformat css

autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w

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

set t_Co=256

set background=dark
colorscheme mac_classic

let s:now = strftime("%H")

if s:now > 6
    if s:now < 8
        set background=light
        colorscheme mac_classic
    endif
endif

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

" Vim Ctrl - P 
" -------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
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

" multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-o>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:godef_split=2

command! -buffer FmtC call s:CFormat()

" C/C++ code formating via the indent binary
function! s:CFormat()
    let view = winsaveview()
    %!indent -linux
    if v:shell_error
        %| " output errors returned by indent
        undo
	echohl Error | echomsg "indent returned error" | echohl None
    endif
    call winrestview(view)
endfunction
