if executable("hoogle")
  setlocal keywordprg=hoogle
endif
autocmd InsertLeave <buffer> update
