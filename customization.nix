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
      vim-stylish-haskell
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
      myPlugins.ghcid
      myPlugins.todotxt
      hoogle
    ];
    opt = [
      neco-ghc
      ghc-mod-vim
    ];
  };
  customRC = ''
    ${generic}

    ${mappings}

    " Triage vim-hoogle
    if(executable('hoogle'))
      autocmd BufEnter *.hs :setlocal keywordprg=:Hoogle
    endif
  '';
}
