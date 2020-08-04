if !exists("g:async_cabal_loaded") && exists("g:async_cabal_enable") && g:async_cabal_enable
  echo "Enabling"
  autocmd BufWritePost *.hs call CabalRun()
  autocmd CursorMoved *.hs call CabalErrorPopup()
  autocmd User AsyncRunStop call CabalSign()
  let g:async_cabal_loaded = 1
endif
