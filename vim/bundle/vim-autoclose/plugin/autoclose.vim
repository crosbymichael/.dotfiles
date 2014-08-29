" File: autoclose.vim
" Author: Karl Guertin <grayrest@gr.ayre.st>
" Version: 1.2
" Last Modified: June 18, 2009
" Description: AutoClose, closes what's opened.
"
"    This plugin closes opened parenthesis, braces, brackets, quotes as you
"    type them. As of 1.1, if you type the open brace twice ({{), the closing
"    brace will be pushed down to a new line.
"
"    You can enable or disable this plugin by typing \a (or <Leader>a if you
"    changed your Leader char). You can define your own mapping and will need
"    to do so if you have something else mapped to \a since this plugin won't
"    clobber your mapping. Here's how to map \x:
"
"       nmap <Leader>x <Plug>ToggleAutoCloseMappings
"
"    You'll also probably want to know you can type <C-V> (<C-Q> if mswin is
"    set) and the next character you type doesn't have mappings applied. This
"    is useful when you want to insert only an opening paren or something.
"
"    NOTE: If you're using this on a terminal and your arrow keys are broken,
"          be sure to :set ttimeout and :set ttimeoutlen=100
"
"    Version Changes: --------------------------------------------------{{{2
"    1.2   -- Fixed some edge cases where double the closing characters are
"             entered when exiting insert mode.
"             Finally (!) reproduced the arrow keys problem other people were
"             running into and fixed.
"             Typing a closing character will now behave consistently (jump
"             out) regardless of the plugin's internal state.
"
"             As a part of the close fix, I've opted to not try tracking the
"             position of the closing characters through all the things that
"             could be done with them, so arrowing/jumping around and not
"             winding up back where you started will cause the input to not be
"             repeatable.
"             June 18, 2009
"    1.1.2 -- Fixed a mapping typo and caught a double brace problem,
"             September 20, 2007
"    1.1.1 -- Missed a bug in 1.1, September 19, 2007
"    1.1   -- When not inserting at the end, previous version would eat chars
"             at end of line, added double open->newline, September 19, 2007
"    1.0.1 -- Cruft from other parts of the mapping, knew I shouldn't have
"             released the first as 1.0, April 3, 2007

" Setup -----------------------------------------------------{{{2
if &cp
    finish
endif


let s:autoclose_mapped = 0
let s:cotstate = &completeopt

fun! g:AutoCloseJumpAfterPair()
    " TODO: move pairs list to variable.
	let re = "['\"\\])}`]"
	let [lnum, col] = searchpos(re, 'n')

	if getline('.')[col('.') - 1] =~ re
		let col = col('.')
	else
		if lnum != line('.')
			call feedkeys("\<TAB>", 'n')
			return
		endif
	endif

	call setpos('.', [0, line('.'), col + 1])
endfun

" (Toggle) Mappings -----------------------------{{{1
"
nmap <Plug>ToggleAutoCloseMappings :call <SID>ToggleAutoCloseMappings()<CR>
if (!hasmapto( '<Plug>ToggleAutoCloseMappings', 'n' ))
    command! AutoCloseToggle call <SID>ToggleAutoCloseMappings()
endif
fun! <SID>AutoCloseMappingsOn() " {{{2
    inoremap <silent> " <C-R>=<SID>QuoteDelim('"')<CR>
    inoremap <silent> ` <C-R>=<SID>QuoteDelim('`')<CR>
    inoremap <silent> ' <C-R>=match(getline('.')[col('.') - 2],'\w') == 0 && getline('.')[col('.')-1] != "'" ? "'" : <SID>QuoteDelim("'")<CR>
    inoremap <silent> ( (<C-R>=<SID>CloseStackPush(')')<CR>
    inoremap <silent> ) <C-R>=<SID>CloseStackPop(')', '(')<CR>
    inoremap <silent> [ [<C-R>=<SID>CloseStackPush(']')<CR>
    inoremap <silent> ] <C-R>=<SID>CloseStackPop(']', '[')<CR>
    inoremap <silent> { {<C-R>=<SID>CloseStackPush('}')<CR>
    inoremap <silent> } <C-R>=<SID>CloseStackPop('}', '{')<CR>
    inoremap <silent> <BS> <C-R>=<SID>OpenCloseBackspaceOrDel("BS")<CR>
    inoremap <silent> <C-h> <C-R>=<SID>OpenCloseBackspaceOrDel("BS")<CR>
    inoremap <silent> <Del> <C-R>=<SID>OpenCloseBackspaceOrDel("Del")<CR>
    inoremap <silent> <Esc> <C-R>=<SID>CloseStackPop('', '')<CR><Esc>
    inoremap <silent> <C-[> <C-R>=<SID>CloseStackPop('', '')<CR><C-[>
    inoremap <silent> {<CR> {<CR>}<C-O>O
    "the following simply creates an ambiguous mapping so vim fully
    "processes the escape sequence for terminal keys, see 'ttimeout' for a
    "rough explanation, this just forces it to work
    if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
      inoremap <silent> <C-[>OC <RIGHT>
    endif
    let g:autoclose_on = 1
    let s:autoclose_mapped = 1
    echo "AutoClose On"
endf
fun! <SID>AutoCloseMappingsOff() " {{{2
    if exists("g:autoclose_on") && s:autoclose_mapped
        iunmap "
        iunmap '
        iunmap `
        iunmap (
        iunmap )
        iunmap [
        iunmap ]
        iunmap {
        iunmap }
        iunmap <BS>
        iunmap <C-h>
        iunmap <Del>
        iunmap <Esc>
        iunmap `
        iunmap {<CR>
        let s:autoclose_mapped = 0
        echo "AutoClose Off"
    endif
    let g:autoclose_on = 0
endf
fun! <SID>ToggleAutoCloseMappings() " --- {{{2
    if exists("g:autoclose_on") && g:autoclose_on
        call <SID>AutoCloseMappingsOff()
    else
        call <SID>AutoCloseMappingsOn()
    endif
endf
let s:closeStack = []

" AutoClose Utilities -----------------------------------------{{{1
function! <SID>OpenSpecial(ochar,cchar) " ---{{{2
    let line = getline('.')
    let col = col('.') - 2
    "echom string(col).':'.line[:(col)].'|'.line[(col+1):]
    if a:ochar == line[(col)] && a:cchar == line[(col+1)] "&& strlen(line) - (col) == 2
        "echom string(s:closeStack)
        while len(s:closeStack) > 0
            call remove(s:closeStack, 0)
        endwhile
        return "\<esc>a\<CR>;\<CR>".a:cchar."\<esc>\"_xk$\"_xa"
    endif
    return a:ochar.<SID>CloseStackPush(a:cchar)
endfunction

function! <SID>CloseStackPush(char) " ---{{{2
    "echom "push"
    let line = getline('.')
    let col = col('.')-2
    if (col) < 0
        call setline('.',a:char.line)
    else
        "echom string(col).':'.line[:(col)].'|'.line[(col+1):]
        call setline('.',line[:(col)].a:char.line[(col+1):])
    endif
    call insert(s:closeStack, a:char)
    "echom join(s:closeStack,'').' -- '.a:char
    return ''
endf

function! <SID>JumpOut(char, pair) " ----------{{{2
    let column = col('.') - 1
    let line = getline('.')
    let mcol = match(line[column :], a:char)
    if a:pair == ''
        let pcol = -1
    else
        let pcol = match(line[column :], a:pair)
    endif
    if a:char != '' && mcol >= 0 && mcol <= pcol
        "Yeah, this is ugly but vim actually requires each to be special
        "cased to avoid screen flashes/not doing the right thing.
        " echom len(line).' '.(column+mcol)
        if line[column] == a:char
            return "\<Right>"
        elseif column+mcol == len(line)-1
            return "\<C-O>A"
        else
            return "\<C-O>f".a:char."\<Right>"
        endif
    else
        return a:char
    endif
endf
function! <SID>CloseStackPop(char, pair) " ---{{{2
    "echom "pop"
    if(a:char == '')
        silent! pclose
    endif
    echom len(s:closeStack)
    if len(s:closeStack) == 0
        return <SID>JumpOut(a:char, a:pair)
    endif
    let column = col('.') - 1
    let line = getline('.')
    let popped = ''
    let lastpop = ''
    "echom join(s:closeStack,'').' || '.lastpop
    let oldStack = s:closeStack[:]
    while len(s:closeStack) > 0 && ((lastpop == '' && popped == '') || lastpop != a:char)
        let lastpop = remove(s:closeStack,0)
        let popped .= lastpop
        "echom join(s:closeStack,'').' || '.lastpop.' || '.popped
    endwhile
    if lastpop != a:char
        let s:closeStack = oldStack
        return <SID>JumpOut(a:char, a:pair)
    endif
    "echom ' --> '.popped
    if line[column : column+strlen(popped)-1] != popped
        return <SID>JumpOut(a:char, a:pair)
    endif
    if column > 0
        call setline('.',line[:column-1].line[(column+strlen(popped)):])
    else
        call setline('.','')
    endif
    return popped
endf

function! <SID>QuoteDelim(char) " ---{{{2
  " If this is a Vim file, and user has requested it, do not pair double-quote
  if (a:char == '"' && exists("g:autoclose_vim_commentmode") && exists("b:current_syntax") && b:current_syntax == "vim")
    return '"'
  endif
  let line = getline('.')
  let col = col('.')
  if line[col - 2] == "\\"
    "Inserting a quoted quotation mark into the string
    return a:char
  elseif line[col - 1] == a:char
    "Escaping out of the string
    return "\<C-R>=".s:SID()."CloseStackPop(\"\\".a:char."\", '')\<CR>"
  else
    "Starting a string
    return a:char."\<C-R>=".s:SID()."CloseStackPush(\"\\".a:char."\")\<CR>"
  endif
endf

" The strings returned from QuoteDelim aren't in scope for <SID>, so I
" have to fake it using this function (from the Vim help, but tweaked)
function! s:SID()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID$')
endfun

function! <SID>OpenCloseBackspaceOrDel(map) " ---{{{2
    "if pumvisible()
    "    pclose
    "    call <SID>StopOmni()
    "    return "\<C-E>"
    "else
        let curline = getline('.')
        let curpos = col('.')
        if a:map == 'Del'
            let curpos -= 1
        end
        let curletter = curline[curpos-1]
        let prevletter = curline[curpos-2]
        if (prevletter == '"' && curletter == '"') ||
\          (prevletter == "'" && curletter == "'") ||
\          (prevletter == "(" && curletter == ")") ||
\          (prevletter == "{" && curletter == "}") ||
\          (prevletter == "[" && curletter == "]") ||
\          (prevletter == "`" && curletter == "`") ||
\          (prevletter == "<" && curletter == ">")
            if a:map == 'Del'
                call insert(s:closeStack, curletter)
                return "\<Del>"
            end
            " undo insert
            if len(s:closeStack) > 0
                call remove(s:closeStack,0)
            endif
            return "\<Del>\<BS>"
        endif

        " return key as is (Del or BS)
        if a:map == 'Del' | return "\<Del>" | else | return "\<BS>" | endif
    "endif
endf

" Initialization ----------------------------------------{{{1
if !exists('g:autoclose_on') || g:autoclose_on
    silent call <SID>AutoCloseMappingsOn()
else
    silent call <SID>AutoCloseMappingsOff()
endif

" vim: set ft=vim ff=unix et sw=4 ts=4 :
" vim600: set foldmethod=marker foldmarker={{{,}}} foldlevel=1 :
