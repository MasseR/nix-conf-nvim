let g:deoplete#enable_at_startup = 1

colorscheme zenburn

set mouse="a"

" Show tabs
set list listchars=tab:»·,nbsp:␣,trail:·

set completeopt=longest,menuone

set textwidth=0
set softtabstop=2
set shiftwidth=2
set tabstop=2
set autoindent
set expandtab
set ruler
set wildmenu

set backup
silent !mkdir ~/.backup > /dev/null 2>&1
set backupdir=~/.backup/

set undofile
set undodir=$HOME/.vim-undos/

let g:ctrlp_cmd = "CtrlPBufTag"

set ignorecase
set smartcase

set autoread

let g:ctrlp_root_markers = ['pom.xml', '.projectile', '.git', '*.cabal', 'package.yaml']
" Git ignore
set wildignore+=*/.git/*,*.orig,*_LOCAL_*,*_REMOTE_*,*_BACKUP_*,*_BASE_*
" Haskell ignore
set wildignore+=*.hi,*.o,*/dist/*,*_o,*/dist-newstyle/*
" Java ignore
set wildignore+=*/target/*,*.class
" Node
set wildignore+=node_modules

set tags=tags;
" let g:gutentags_ctags_executable = "ctags"
" let g:gutentags_ctags_exclude = ["node_modules"]

set hlsearch
set incsearch
set hidden

" Markdown settings
let g:vim_markdown_fenced_languages = ['sql=sql', 'xml=xml', 'dot=dot']

" Backspace settings
set backspace=start " :help 'backspace' for examples

" In case of nvim
if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
endif

" Statusline always
set laststatus=2

let g:vimwiki_list = [ {'path': '~/wikidata/', 'path_html': '~/public_html/', 'ext': '.md', 'syntax': 'markdown'} , {'path': '~/personal_wiki/', 'ext': '.md', 'syntax': 'markdown'}]
let g:vimwiki_dir_link = 'index'

if has('nvim')
    :tnoremap <Esc> <C-\><C-n>
    :tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
    :tnoremap <A-h> <C-\><C-N><C-w>h
    :tnoremap <A-j> <C-\><C-N><C-w>j
    :tnoremap <A-k> <C-\><C-N><C-w>k
    :tnoremap <A-l> <C-\><C-N><C-w>l
    :inoremap <A-h> <C-\><C-N><C-w>h
    :inoremap <A-j> <C-\><C-N><C-w>j
    :inoremap <A-k> <C-\><C-N><C-w>k
    :inoremap <A-l> <C-\><C-N><C-w>l
    :nnoremap <A-h> <C-w>h
    :nnoremap <A-j> <C-w>j
    :nnoremap <A-k> <C-w>k
    :nnoremap <A-l> <C-w>l
endif

function! HsCheck()
  if exists(":GhcModCheckAsync")
    :GhcModCheckAsync
  endif
endfunction
" autocmd BufwritePost *.hs call HsCheck()

autocmd CursorHold *.* checktime

let g:elm_format_autosave = 0

" Vim swap
silent !mkdir ~/.vim/swap > /dev/null 2>&1
set directory=~/.vim/swap
