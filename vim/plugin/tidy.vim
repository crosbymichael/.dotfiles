" ============================================================================
" File: tidy.vim
" Author: Gary Johnson <garyjohn@spk.agilent.com>
" Created: Thu Nov  8 08:50:11 2001
" Last Modified: Wed Jan  9 00:19:15 2002
" Version: $Revision: 1.3 $
" Description:
" 	The :Tidy command finds and reports errors in HTML files in the
" 	same manner that :make reports errors in other languages.  It
" 	does this by running the 'tidy' program (from
" 	http://www.w3.org/People/Raggett/tidy/) on the current file and
" 	capturing the error messages so that they can be accessed with
" 	the Quickfix commands (:cn, et al.).  The HTML file itself is
" 	not modified.
" Usage:
"	:Tidy
" ============================================================================

" Avoid loading this file twice or when 'compatible' is set, and allow
" the user to disable loading it.
"
if exists("loaded_tidy") || &cp
    finish
endif
let loaded_tidy = 1

command! Tidy call Tidy()

" Use :make to run 'tidy' on the current file.
"
function! Tidy()

   " Save previous 'make' options.
   "
   let ef=&errorformat
   let mp=&makeprg

   " Set new 'make' options for running 'tidy'.
   "
   set errorformat=%f:%l:%c:\ %m
   set makeprg=tidy\ -e\ --gnu-emacs\ yes

   " Do it.
   "
   execute "make " . expand("%")

   " Restore previous 'make' options.
   "
   let &makeprg=mp
   let &errorformat=ef

endfunction
