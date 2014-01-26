nmap <F5> :call Run(&ft)<CR>
cabbrev pyx call Run('python')
cabbrev perlx call Run('perl')
cabbrev rubyx call Run('ruby')

fu! NewThrowawayBuffer()
    new
    setlocal noswapfile
    setlocal buftype=nowrite
    setlocal bufhidden=delete
endf

fu! Run(cmd)
    only
    %y
    call NewThrowawayBuffer()
    wincmd J
    resize 15
    put
    exe "%!" . a:cmd
    0 read !date
    append
----------------------------
.
    wincmd w
endf
