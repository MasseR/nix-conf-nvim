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
      vim-markdown
      vim-nix
      fugitive
      Tagbar
      signature
      vim-orgmode
      vim-easy-align
      dhall-vim
      easy-align
      purescript-vim
      xptemplate
      myPlugins.customtemplates
      myPlugins.vim-trailing-whitespace
      myPlugins.vim-haskell-indent
      myPlugins.nerdtree
      myPlugins.syntastic
      myPlugins.vim-gnupg
      myPlugins.tcomment_vim
      myPlugins.unimpaired
      myPlugins.gutentags
    ];
    opt = [
    ];
  };
  customRC = let
    hasktagging = pkgs.buildEnv {
      name ="hasktagging-complete";
      paths = with pkgs.haskellPackages; [ (callPackage ./hasktagging {}) hasktags pkgs.ctags ];
    };
  in ''
    ${generic}

    ${mappings}

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
    set statusline+=%{gutentags#statusline()}
    " call add(g:gutentags_project_info, {'type': 'haskell', 'glob': '*.cabal'})
    let g:gutentags_project_info = [{'type': 'haskell', 'glob': '*.cabal'}]
    " call add(g:gutentags_project_info, {'type': 'haskell', 'glob': '*.cabal'})
    let g:gutentags_ctags_executable_haskell = '${hasktagging}/bin/hasktagging'
    let g:gutentags_ctags_executable = '${pkgs.ctags}/bin/ctags'
  '';
}
