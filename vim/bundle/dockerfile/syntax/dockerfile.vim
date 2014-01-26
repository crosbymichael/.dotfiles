" dockerfile.vim - Syntax highlighting for Dockerfiles
" Maintainer:   Honza Pokorny <http://honza.ca>
" Version:      0.5


if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "dockerfile"

syntax keyword dockerfileKeyword FROM MAINTAINER RUN CMD EXPOSE ENV ADD
syntax keyword dockerfileKeyword ENTRYPOINT VOLUME
highlight link dockerfileKeyword Keyword

syntax region dockerfileString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link dockerfileString String

syntax match dockerfileComment "\v#.*$"
highlight link dockerfileComment Comment
