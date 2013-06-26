if exists('b:current_syntax')
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'quickrun'
endif

syntax case ignore

" Perl {{{
syntax match plendfail /\(^result:\sfail\|^failed\s\d\+\/\d\+\ssubtests\|^#\sLooks\slike\syou\sfailed\s\d\+\stest\sof\s\d\+\.\)/
syntax match plendpass /\(^result:\spass\|^all\stests\ssuccessful\.\)/

highlight plendpass ctermfg=DarkGreen guifg=DarkGreen guibg=White
highlight plendfail ctermfg=DarkRed guifg=DarkRed guibg=White
highlight plfailstatus ctermfg=DarkRed guifg=DarkRed guibg=White
" }}}

" unlet b:current_syntax
let b:current_syntax = 'quickrun'

if main_syntax == 'quickrun'
  unlet main_syntax
endif
