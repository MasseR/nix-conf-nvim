let mapleader = " "
let maplocalleader = " "

" Generic
noremap <leader>w :w<cr>

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
noremap <leader>gs :Gstatus<cr>
noremap <leader>gbl :Gblame<cr>
noremap <leader>glg :Glog<cr>
noremap <leader>ged :Gedit<cr>

" File helpers, prefix f
noremap <leader>ft :NERDTreeToggle<cr>

" Buffer helpers, prefix b
noremap <Leader>bl :CtrlPBuffer<cr>
noremap <Leader>bd :bd<cr>
noremap <leader>bu :GundoToggle<cr>

noremap ' `
noremap ` '

" CtrlP stuff
noremap <Leader>lb :CtrlPBuffer<cr>
noremap <Leader>lf :CtrlP<cr>
noremap <Leader>lt :CtrlPTag<cr>
noremap <Leader>ll :CtrlPTag<cr>

noremap <Leader>tt :Tagbar<cr>

" prosession
noremap <Leader>ss :CtrlPObsession<cr>

" Misc
noremap <leader>ut :GundoToggle<cr>
noremap <F2> :GundoToggle<cr>

" Fold helper
" Close all except current line
noremap <leader>z zMzv

" Start template
if !has("gui_running")
  " Terminal doesn't send the correct sequence
  inoremap <C-@> <C-R>=XPTemplateStart(0,{'k':'<C-\++'})<CR>
else
  inoremap <C-Space> <C-R>=XPTemplateStart(0,{'k':'<C-\++'})<CR>
endif
