if exists('g:loaded_textobj_heredoc') || &compatible
    finish
endif
let g:loaded_textobj_heredoc = 1
let s:keepcpo = &compatible
set compatible&vim


call textobj#user#plugin('heredoc', {
            \   '-': {
            \     'select-a': 'aH', '*select-a-function*' : 'heredoc#get_heredoc_a',
            \     'select-i': 'iH', '*select-i-function*' : 'heredoc#get_heredoc_i',
            \     'sfile' : expand('<sfile>:p')
            \   },
            \ })

let &cpoptions = s:keepcpo
unlet s:keepcpo
