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
      obsidian-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      lspkind-nvim
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
      myPlugins.nvim-codeium
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
      # myPlugins.nvim-codeium
      # codeium-nvim

      # I might be switching between copilot and codeium depending on where I'm
      # coding and I don't want them conflicting
      copilot-vim

    ];
  };
  customRC = with builtins;
  let
    codeium-lsp = with pkgs; stdenv.mkDerivation rec {
      pname = "codeium-lsp";
      version = "v1.8.80";
      src = fetchurl {
        url = "https://github.com/Exafunction/codeium/releases/download/language-server-${version}/language_server_linux_x64";
        sha256 = "sha256-0LZKNjDj2MXsGJRwkeuk9KEHRtU2Tgdccw1o0BTR5/M=";
      };
      nativeBuildInputs = [ autoPatchelfHook ];
      phases = ["installPhase" "fixupPhase"];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/codeium_language_server
        chmod +x $out/bin/codeium_language_server
      '';
    };
    nix-env = with pkgs; runCommand "nix-environment.lua" { codeium = codeium-lsp; }
    ''
      substituteAll ${./vimrc/nix-env.lua.in} $out
    '';
  in ''
    luafile ${nix-env}
    ${readFile ./vimrc/generic.vim}
    ${readFile ./vimrc/mappings.vim}
    ${readFile ./vimrc/abbreviations.vim}
    ${readFile ./vimrc/zettel_settings.vim}
    luafile ${./vimrc/lsp_settings.lua}
    luafile ${./vimrc/telescope.lua}
    luafile ${./vimrc/cmp.lua}
    luafile ${./vimrc/obsidian.lua}
  '';
}
