" C source code formating via GNU indent
"
" Documentation:
" https://www.gnu.org/software/indent/manual/indent.html
"
" Install:
" deb: apt-get install indent
" rpm: yum install indent

if exists("g:loaded_cfmt") 
    finish
endif
let g:loaded_cfmt = 1

if !exists("g:cfmt_style")
    let g:cfmt_style = '-gnu'
endif

command! Cfmt call s:IndentC()

function! s:IndentC()
    let view = winsaveview()
    execute  '%!indent ' . g:cfmt_style
    if v:shell_error
        %| " output errors returned by indent
        undo
        echohl Error | echomsg "indent returned error" | echohl None
    endif
    call winrestview(view)
endfunction
