let g:zettel_format="%raw_title"
" Search from the zettel directory
" use <c-y> to create a new file
noremap <leader>orf :CtrlP ~/zettel<cr>
noremap <leader>ordd :call ZettelDaily("~/zettel")<cr>
noremap <leader>owf :CtrlP ~/work_zettel/work<cr>
noremap <leader>owdd :call ZettelDaily("~/work_zettel/work")<cr>

let s:timefmt = "%Y-%m-%d.%a"
function! ZettelEvalTemplate(path)
  execute "0r " . a:path
  execute ":%s/{{yesterday}}/\\=strftime(\"" . s:timefmt . "\", localtime() - 3600 * 24)/ge"
  execute ":%s/{{tomorrow}}/\\=strftime(\"" . s:timefmt . "\", localtime() + 3600 * 24)/ge"
  execute "norm gg"
endfunction

function! ZettelDaily(root)
  let s:today = strftime(s:timefmt)
  let s:path = expand(a:root . "/" . s:today . ".md")
  if filereadable(s:path)
    execute "edit " . s:path
  else
    execute "edit " . s:path
    execute "chdir " . a:root
    call ZettelEvalTemplate(a:root . "/templates/Daily.md")
  endif
endfunction
