{pkgs}:
let
  # myPlugins = (import ./plugins.nix){pkgs=pkgs;};
  myPlugins = pkgs.callPackage ./plugins.nix {};

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
      signature
      dhall-vim
      purescript-vim
      xptemplate
      todo-txt-vim
      vim-ledger
      myPlugins.masser # Custom ftplugins
      myPlugins.vim-trailing-whitespace
      myPlugins.vim-haskell-indent
      myPlugins.nerdtree
      myPlugins.syntastic
      myPlugins.vim-gnupg
      myPlugins.tcomment_vim
      myPlugins.vim-unimpaired
      myPlugins.vim-gutentags
      myPlugins.vim-lsp
      myPlugins.vim-ghcid-quickfix
    ];
    opt = [
    ];
  };
  customRC = with builtins; ''
    ${readFile ./vimrc/generic.vim}
    ${readFile ./vimrc/mappings.vim}
    ${readFile ./vimrc/lsp_settings.vim}
    ${readFile ./vimrc/abbreviations.vim}
  '';
}
