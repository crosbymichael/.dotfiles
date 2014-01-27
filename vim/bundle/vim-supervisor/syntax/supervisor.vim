" Vim syntax fil
" Language:	supervisor ctl output
" Maintainer:	Lowe Thiderman <lowe.thiderman@gmail.com>
" Last Change:	2012 November 21

if exists("b:current_syntax")
  finish
endif

syn case match
syn sync minlines=50

if has("spell")
  syn spell toplevel
endif

syn match   supervisorApplication	"^\S\+"
syn match   supervisorStale			"can't find command"
syn match   supervisorStale			"STOPPED.*"
syn match   supervisorFile			"'\zs/.*\ze'$"
syn match   supervisorLabel			"pid \d\+" contains=supervisorPid
syn match   supervisorPid			"pid \zs\d\+\ze" contained
syn match   supervisorLabel			"uptime \d\+:\d\d:\d\d" contains=supervisorUptime
syn match   supervisorUptime		"uptime \zs\d\+:\d\d:\d\d\ze" contained

syn keyword supervisorError FATAL
syn keyword supervisorRunning RUNNING
syn keyword supervisorInterim STARTING STOPPING RESTARTING
" syn keyword supervisorLabel pid uptime

hi def link supervisorApplication		Keyword
hi def link supervisorStale				Comment
hi def link supervisorError				Error
hi def link supervisorFile				Directory
hi def link supervisorInterim			Preproc
hi def link supervisorLabel				String
hi def link supervisorPid				Function
hi def link supervisorUptime			Number

" TODO: What does one do for this? There is no "Positive" or "Success" hi group.
hi supervisorRunning ctermfg=green cterm=bold gui=bold guifg=#00DA5F

let b:current_syntax = "supervisor"
