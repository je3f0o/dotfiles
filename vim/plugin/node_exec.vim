
function! JeefoTrim(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function! Node_exec(args)
    let l:result = system('node '.a:args)
    let l:index = match(l:result, 'Error:')

    if l:index == -1
        let l:index = match(l:result, 'Stack trace')
    endif

    if l:index != -1
        let stack_str = l:result[l:index + 6:]
        " TODO: maybe \n will not work on windows. test it...
        let stack = split(stack_str, '\n')
        let error_message = JeefoTrim(stack[0])

        let l:i = 1
        let l:length = len(stack)

        let qflist = []

        while l:i < l:length
            let parts = filter(matchlist(stack[l:i], '\%(\s*at \)\?\(.\+\)(\(.\+\)\:\(\d\+\)\:\(\d\+\)'), 'v:val !=# ""')

            if len(parts) != 0
                let error_info = {}
                let error_info.text     = 'at '.JeefoTrim(parts[1]).'()'
                let error_info.filename = parts[2]
                let error_info.lnum     = parts[3]
                let error_info.col      = parts[4]
                call add(qflist, error_info)
            endif

            let l:i = l:i + 1
        endwhile

        echo error_message

        copen 10
        call setqflist(qflist)
    else
        echo l:result
    endif

endfunction

command! -nargs=+ -complete=file_in_path NodeExec call Node_exec(<q-args>)
