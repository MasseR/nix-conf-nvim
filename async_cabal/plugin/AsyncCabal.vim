" async_cabal.vim
"
"
"
"

" let g:async_cabal_project = ''

if !hlexists('CabalStyleErrorSign')
  highlight link CabalStyleErrorSign Error
endif
if !hlexists('CabalStyleErrorLine')
  highlight link CabalStyleErrorLine Error
endif
call sign_define('ErrorSign', { 'texthl': 'CabalStyleErrorSign' , 'linehl': 'CabalStyleErrorLine' , 'text': '>>' })

function! CabalSign()
  call sign_unplace('ErrorSigns')
  let g:async_cabal_errors = {}
  call popup_clear()
  for d in getqflist()
    if d.type == 'E'
      call sign_place(0, 'ErrorSigns', 'ErrorSign', bufname(d.bufnr), {'lnum': d.lnum})
      let g:async_cabal_errors[d.bufnr . ":" . d.lnum] = d.text
    endif
  endfor
endfunction

function! CabalErrorPopup()
  let l:line = getpos(".")[1]
  let l:end = strlen(getline("."))
  let l:idx = bufnr() . ":" . l:line
  if exists("g:async_cabal_errors") && has_key(g:async_cabal_errors, l:idx)
    call popup_atcursor(split(g:async_cabal_errors[l:idx], "\n"), #{moved: [l:line, 0, l:end]})
  endif
endfunction

function! CabalRun()
  if g:async_cabal_enable
    if !exists("g:async_cabal_project")
      let g:async_cabal_project = ''
    endif
    let l:path = findfile("cabal.project", ".;")
    setl errorformat=
          \%-Z\ %#,
          \%W%f:%l:%c:\ Warning:\ %m,
          \%E%f:%l:%c:\ %m,
          \%E%>%f:%l:%c:,
          \%+C\ \ %#%m,
          \%+C\ %#%m,
          \%W%>%f:%l:%c:,
          \%+C\ \ %#%tarning:\ %m,
    let l:project = fnamemodify(l:path, ":p:h") . "/" . split(g:async_cabal_project, ':')[-1]
    execute "lcd " . l:project
    let l:cmd = "AsyncRun -strip cabal new-build " . g:async_cabal_project

    " Stop if there is something running already
    AsyncStop

    " Start execution
    execute l:cmd
  endif
endfunction
