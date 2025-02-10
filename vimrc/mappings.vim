let mapleader = " "
let maplocalleader = " "

" Generic
" noremap <leader>w :w<cr>

" Align config
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign>

" Command-line editing emacs-style
:cnoremap <C-A> <Home>
:cnoremap <C-B> <Left>
:cnoremap <C-F> <Right>
:cnoremap <C-E> <End>

" Same for insert mode (try to prevent using these, they break undo)
:inoremap <C-A> <Home>
:inoremap <C-B> <Left>
:inoremap <C-F> <Right>
:inoremap <C-E> <End>

" Fugitive helpers, prefix g
noremap <leader>gs :Git<cr>

" File helpers, prefix f
noremap <leader>ft :NERDTreeToggle<cr>

" Buffer helpers, prefix b
noremap <Leader>bd :bd<cr>
noremap <leader>bu :GundoToggle<cr>

noremap ' `
noremap ` '



" Misc
noremap <F2> :UndotreeToggle<cr>


" Stylish haskell formatprg. Stylish-haskell prog is provided by nix vim derivation
autocmd BufEnter *.hs :noremap <buffer> <leader>ff ms:%!stylish-haskell<cr>`sms


" For codeium
function EnableAIMapping()
  if exists('g:codeium_server_job')
    imap <buffer><script><silent><nowait><expr> <Tab> codeium#Accept()
    " Not sure these work :think:
    imap <buffer> <C-)>   <Cmd>call codeium#CycleCompletions(1)<CR>
    imap <buffer> <C-(>   <Cmd>call codeium#CycleCompletions(-1)<CR>
    " The Ctrl-x conflicted with omnicompletion
    " imap <C-x>   <Cmd>call codeium#Clear()<CR>
  endif
endfunction

autocmd BufEnter *.hs call EnableAIMapping()
autocmd BufEnter *.ts call EnableAIMapping()
autocmd BufEnter *.js call EnableAIMapping()
autocmd BufEnter *.kotlin call EnableAIMapping()
