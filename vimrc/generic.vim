filetype on
filetype plugin on
filetype indent on
syntax on

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

" Line wrapping
" Enable wrapping and break on word boundaries
set wrap linebreak

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
" Javascript ignore
set wildignore+=*/node_modules/*
" Nix results. The 'result' symlinks get expanded to /nix/store, so I need to
" have that as the ignore
set wildignore+=result-*/*
set wildignore+=result/*
" Java ignore
set wildignore+=*/target/*,*.class

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

" Vimwiki configuration
" These options need to be in the general path
" For more customization, check masser/ftplugin/vimwiki.vim
"
" Also, no multiline lists..?
let g:vimwiki_list = [ {'path': '~/zettel/', 'ext': '.md', 'syntax': 'markdown'}
                   \ , {'path': '~/work_zettel/', 'ext': '.md', 'syntax': 'markdown'}
                   \ ]
let g:vimwiki_dir_link = 'index'
let g:vimwiki_folding = 'expr'

autocmd CursorHold *.* checktime

let g:elm_format_autosave = 0

" Vim swap
silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
set directory=~/.vim/swap

if(has('gui_running'))
  set guioptions=
  set guifont=Iosevka\ 11
  let g:gtk_nocache=[0x00000000, 0xfc00ffff, 0xf8000001, 0x78000001]
endif

" Try out getting used to folding again
" autocmd BufEnter *.hs :setlocal foldmethod=indent
set nofoldenable

" let g:vimwiki_folding='expr'

noremap <leader>aa :vimgrep /:W<C-r>=strftime("%V")<cr>/ ~/wikidata/**/*<cr>

" Teach myself shorter lines
set colorcolumn=110

set number
set relativenumber

" gutentags
" call add(g:gutentags_project_info, {'type': 'haskell', 'glob': '*.cabal'})
let g:gutentags_project_info = [{'type': 'haskell', 'glob': '*.cabal'}]
" call add(g:gutentags_project_info, {'type': 'haskell', 'glob': '*.cabal'})
if executable("hasktagging")
  let g:gutentags_ctags_executable_haskell = 'hasktagging'
endif
if executable("ctags")
  let g:gutentags_ctags_executable = 'ctags'
endif

