{pkgs, inputs, ...}:
let
  # myPlugins = (import ./plugins.nix){pkgs=pkgs;};
  myPlugins = pkgs.callPackage ./plugins.nix { inherit inputs; };

in

{
  plugins = with pkgs.vimPlugins; {
    start = [
      vimproc-vim
      # vimwiki
      vim-gitgutter
      vim-airline
      vim-airline-themes
      zenburn
      undotree
      nvim-surround
      vim-markdown
      Tabular
      bullets-vim
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
      conjure
      cmp-conjure
      which-key-nvim
      diagram-nvim
      codecompanion-nvim
      nvim-treesitter
      nvim-treesitter-parsers.arduino
      nvim-treesitter-parsers.haskell
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.clojure
      nvim-treesitter-parsers.markdown
      nvim-treesitter-parsers.yaml
      nvim-treesitter-parsers.dhall
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.gitcommit
      nvim-treesitter-parsers.gitignore
      nvim-treesitter-parsers.mermaid
      rainbow-delimiters-nvim
      nvim-treesitter-textobjects
      # vim-ledger
      myPlugins.masser # Custom ftplugins
      myPlugins.vim-haskell-indent
      myPlugins.nerdtree
      myPlugins.syntastic
      myPlugins.vim-gnupg
      myPlugins.tcomment_vim
      myPlugins.vim-unimpaired
      myPlugins.vim-gutentags
      myPlugins.vim-ledger
      myPlugins.d2-vim
    ];
    opt = [
      # I have both codeium (free) and copilot (work, money)
      # By having them as optional plugins, I can enable one of them depending
      # on where I'm running
      #
      # The codeium results are IMO much better than the copilot ones, but it is also
      # much more difficult to setup, requiring to patchelf a dynamically linked executable.
      # Speaking of patchelfing, see the 'codeium-lsp' derivation below.
      #
      # When the plugin is updated, it will most likely require a different version of the language server
      #
      # Just update the version string and fix the sha256 and the plugin should work again.
      #
      # This is much nicer than previously when I did the patchelf manually on the machine.
      #
      # There is a couple of definitions defined in the aicompl.lua file. They provide two user commands
      # `:EnableCodeium` and `:EnableCopilot`. I used to just do `:packadd <package>`, but the codeium
      # now requires some lua setup and you can't do it unless the package first exists.
      # myPlugins.nvim-codeium
      codeium-nvim
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
    ${readFile ./vimrc/ledger.vim}
    ${readFile ./vimrc/markdown.vim}
    luafile ${./vimrc/lsp_settings.lua}
    luafile ${./vimrc/telescope.lua}
    luafile ${./vimrc/cmp.lua}
    luafile ${./vimrc/obsidian.lua}
    luafile ${./vimrc/aicompl.lua}
    luafile ${./vimrc/which-key.lua}
    luafile ${./vimrc/treesitter.lua}
    luafile ${./vimrc/image.lua}
    luafile ${./vimrc/codecompanion.lua}
    luafile ${./vimrc/diagram.lua}
    luafile ${./vimrc/surround.lua}
  '';
}
