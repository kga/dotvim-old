autocmd BufNewFile,BufRead *.tt2\= setfiletype tt2html
 " setfiletype だとすでに filetype が決定済みの時は実行されない
autocmd BufNewFile,BufRead */templates/*.html set filetype=tt2html
