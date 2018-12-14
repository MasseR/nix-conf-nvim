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
    ];
    opt = [
      neco-ghc
      ghc-mod-vim
      vim-stylish-haskell
    ];
  };
  customRC = ''
    ${generic}

    ${mappings}

    " Triage vim-hoogle
    if(executable('hoogle'))
      autocmd BufEnter *.hs :setlocal keywordprg=:Hoogle
    endif
    " Stylish haskell formatprg. Stylish-haskell prog is provided by nix vim derivation
    autocmd BufEnter *.hs :setlocal formatprg=stylish-haskell

    let g:vimwiki_folding='expr'

    noremap <leader>aa :vimgrep /:W<C-r>=strftime("%V")<cr>/ ~/wikidata/**/*<cr>
  '';
}
