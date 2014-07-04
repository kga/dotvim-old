"nnoremap K :Perldoc<CR>
setlocal iskeyword+=:

augroup pm-autoinsert-package
    autocmd!
    autocmd BufNewFile *.pm call append(0, [
                \ 'package ' . fnamemodify(expand('%'), ':r:s.^lib/..:gs./.::.') . ';',
                \ 'use strict;', 'use warnings;'
                \ ])
                \ | call append(line('$'), '1;')
                \ | set modified
augroup END
