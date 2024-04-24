{pkgs, inputs, ...}:
let
  # myPlugins = (import ./plugins.nix){pkgs=pkgs;};
  myPlugins = pkgs.callPackage ./plugins.nix { inherit inputs; };

in

{
  plugins = with pkgs.vimPlugins; {
    start = [
      elm-vim
      vimproc-vim
      vimwiki
      vim-gitgutter
      vim-airline
      vim-airline-themes
      zenburn
      ctrlp-vim
      undotree
      vim-surround
      vim-markdown
      vim-nix
      vim-fugitive
      vim-signature
      dhall-vim
      purescript-vim
      # xptemplate
      todo-txt-vim
      direnv-vim
      nvim-lspconfig
      telescope-nvim
      telescope-ui-select-nvim
      kotlin-vim
      # vim-ledger
      myPlugins.masser # Custom ftplugins
      myPlugins.vim-trailing-whitespace
      myPlugins.vim-haskell-indent
      myPlugins.nerdtree
      myPlugins.syntastic
      myPlugins.vim-gnupg
      myPlugins.tcomment_vim
      myPlugins.vim-unimpaired
      myPlugins.vim-gutentags
      myPlugins.vim-ledger
    ];
    opt = [
      # The codeium plugin is a bit iffy in the nixos world. It's fetching the
      # codeium plugin from github and installing it under
      # ~/.codeium/bin/<hash>/ and has the wrong interpreter. Fixing the
      # interpreter requires patchelfing, but doing it manually is obviously
      # finicky, breaking whenever the libc is changed.
      #
      # To check whether the codeium server is successfully running, you can
      # check the g:codeium_server_job variable
      #
      # To fix the interpreter, run:
      # patchelf --set-interpreter $(patchelf --print-interpreter $(readlink -f $(which patchelf))) language_server_linux_x64
      #
      # For keybindings, see the mappings.vim file
      # As a spoiler, to accept the suggestion, run: Ctrl-g
      #
      # The plugin is set to be optional, to enable it, run: :packadd vim-codeium
      myPlugins.vim-codeium

      # I might be switching between copilot and codeium depending on where I'm
      # coding and I don't want them conflicting
      copilot-vim
    ];
  };
  customRC = with builtins; ''
    ${readFile ./vimrc/generic.vim}
    ${readFile ./vimrc/mappings.vim}
    ${readFile ./vimrc/abbreviations.vim}
    ${readFile ./vimrc/zettel_settings.vim}
    luafile ${./vimrc/lsp_settings.lua}
    luafile ${./vimrc/telescope.lua}
  '';
}
