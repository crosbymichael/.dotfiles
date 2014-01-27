if exists('g:loaded_supervisor') || &cp || v:version < 700
  finish
endif
let g:loaded_supervisor = 1

let s:cpo_save = &cpo
set cpo&vim

function! s:Detect(filename)
  if exists('b:supervisor_root')
    return supervisor#BufInit()
  endif

  let fn = substitute(fnamemodify(a:filename, ":p"), '\c^file://', '', '')
  let ofn = ""

  while fn != ofn
    let ofn = fn
    let fn = fnamemodify(fn, ":h")

    if filereadable(fn . '/supervisord.conf')
      let b:supervisor_root = fn
      break
    elseif filereadable(fn . '/supervisord/supervisord.conf')
      let b:supervisor_root = fn . '/supervisord'
      break
    endif
  endwhile

  if exists('b:supervisor_root')
    call supervisor#BufInit()
  endif
endfunction

augroup supervisorDetect
  autocmd!
  autocmd BufNewFile,BufRead * call s:Detect(expand("<afile>:p"))
augroup END

let &cpo = s:cpo_save
" vim:set sw=2 sts=2:
