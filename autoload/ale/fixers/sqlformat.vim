call ale#Set('sql_sqlformat_executable', 'sqlformat')
call ale#Set('sql_sqlformat_options', '-k upper -i upper')

function! ale#fixers#sqlformat#Fix(buffer) abort
    let l:executable = ale#Var(a:buffer, 'sql_sqlformat_executable')
    let l:options = ale#Var(a:buffer, 'sql_sqlformat_options')

    return {
    \   'command': ale#Escape(l:executable)
    \       . ' -w'
    \       . (empty(l:options) ? '' : ' ' . l:options),
    \}
endfunction
