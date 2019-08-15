{pkgs}:
let
  # myPlugins = (import ./plugins.nix){pkgs=pkgs;};
  myPlugins = pkgs.callPackage ./plugins.nix {};
  generic = builtins.readFile ./vimrc/generic.vim;
  mappings = builtins.readFile ./vimrc/mappings.vim;

in

{
  plugins = with pkgs.vimPlugins; {
    start = [
      elm-vim
      vimproc
      vimwiki
      gitgutter
      airline
      vim-airline-themes
      zenburn
      ctrlp
      Gundo
      surround
      easy-align
      vim-markdown
      vim-nix
      fugitive # You can use this if you prepend the # symbol with a space
      Tagbar
      signature
      vim-orgmode
      vim-easy-align
      vim-speeddating
      ultisnips
      vim-snippets
      dhall-vim
      easy-align
      purescript-vim
      myPlugins.vim-trailing-whitespace
      myPlugins.vim-haskell-indent
      myPlugins.nerdtree
      myPlugins.syntastic
      myPlugins.vim-gnupg
      myPlugins.vim-obsession
      myPlugins.vim-prosession
      myPlugins.ctrlp-obsession
      myPlugins.tcomment_vim
      myPlugins.unimpaired
      myPlugins.gutentags
    ];
    opt = [
      neco-ghc
      ghc-mod-vim
      vim-stylish-haskell
    ];
  };
  customRC = let
    hasktagging = pkgs.buildEnv {
      name ="hasktagging-complete";
      paths = with pkgs.haskellPackages; [ (callPackage ./hasktagging {}) hasktags ];
    };
  in ''
    ${generic}

    ${mappings}

    " Stylish haskell formatprg. Stylish-haskell prog is provided by nix vim derivation
    autocmd BufEnter *.hs :setlocal formatprg=stylish-haskell
    " Try out getting used to folding again
    " autocmd BufEnter *.hs :setlocal foldmethod=indent

    " let g:vimwiki_folding='expr'

    noremap <leader>aa :vimgrep /:W<C-r>=strftime("%V")<cr>/ ~/wikidata/**/*<cr>

    " Teach myself shorter lines
    set colorcolumn=110

    set number
    set relativenumber

    " gutentags
    set statusline+=%{gutentags#statusline()}
    " call add(g:gutentags_project_info, {'type': 'haskell', 'glob': '*.cabal'})
    let g:gutentags_project_info = [{'type': 'haskell', 'glob': '*.cabal'}]
    " call add(g:gutentags_project_info, {'type': 'haskell', 'glob': '*.cabal'})
    let g:gutentags_ctags_executable_haskell = '${hasktagging}/bin/hasktagging'
  '';
}
