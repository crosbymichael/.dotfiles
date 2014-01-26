" Vim syntax file
" Language:    Arduino
" Maintainer:  Johannes Hoff <johannes@johanneshoff.com>
" Last Change: 2009 May 24

" Syntax highlighting like in the Arduino IDE
" Keywords extracted from <arduino>/build/shared/lib/keywords.txt

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/cpp.vim
else
  runtime! syntax/cpp.vim
endif

syn keyword arduinoConstant HIGH LOW INPUT OUTPUT SERIAL DISPLAY
syn keyword arduinoConstant DEC BIN HEX OCT BYTE PI
syn keyword arduinoConstant HALF_PI TWO_PI LSBFIRST MSBFIRST CHANGE
syn keyword arduinoConstant FALLING RISING DEFAULT EXTERNAL INTERAL

syn keyword arduinoStdFunc abs acos asin atan atan2 ceil constrain
syn keyword arduinoStdFunc cos degrees exp floor log
syn keyword arduinoStdFunc map max min radians random
syn keyword arduinoStdFunc randomSeed round sin sq sqrt tan

syn keyword arduinoFunc analogReference analogRead analogWrite attachInterrupt detachInterrupt
syn keyword arduinoFunc delay delayMicroseconds digitalWrite digitalRead interrupts
syn keyword arduinoFunc millis noInterrupts pinMode pulseIn shiftOut

syn keyword arduinoMethod begin read print println
syn keyword arduinoMethod available flush setup loop

syn keyword arduinoModule Serial

hi def link arduinoConstant Constant
hi def link arduinoStdFunc Function
hi def link arduinoFunc Function
hi def link arduinoMethod Function
hi def link arduinoModule Identifier

