
function! heredoc#get_heredoc()
    let l:saved = getpos('.')
    call search( '<<[a-zA-Z0-9]', 'bW')
    let l:obj_start = line('.')
    let l:marker = getline('.')
    let l:trimmed = substitute(l:marker, '^[^<]\+[<]\+', '', '')
    let l:trimmed = substitute(l:trimmed, '[^a-zA-Z0-9-]\+$', '', '')
    " echo 'l:trimmed ' . l:trimmed
    " call search( l:trimmed, 'W')
    normal! j
    call search( l:trimmed, 'W')
    let l:obj_end = line('.')
    call setpos( '.', l:saved )
    let l:return = [ 'V', l:obj_start, l:obj_end ]
    " echo return
    return l:return
endfunction

function! heredoc#get_heredoc_a()
    let l:inner = heredoc#get_heredoc()
    return [ l:inner[0], heredoc#make_pos(l:inner[1]), heredoc#make_pos(l:inner[2]) ]
endfunction

function! heredoc#get_heredoc_i()
    let l:inner = heredoc#get_heredoc()
    return [ l:inner[0], heredoc#make_pos(l:inner[1] + 1), heredoc#make_pos(l:inner[2] -1) ]
endfunction

function! heredoc#make_pos(line)
    return [ 0, a:line, 0, 0]
endfunction
