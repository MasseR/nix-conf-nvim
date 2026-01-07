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
      zenburn
      lualine-nvim
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
      todo-txt-vim
      direnv-vim
      nvim-lspconfig
      telescope-nvim
      telescope-ui-select-nvim
      kotlin-vim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      lspkind-nvim
      conjure
      cmp-conjure
      which-key-nvim
      diagram-nvim
      tcomment_vim
      syntastic
      unimpaired-nvim
      vim-ledger
      zk-nvim
      nvim-treesitter
      nvim-treesitter-parsers.arduino
      nvim-treesitter-parsers.haskell
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.typescript
      nvim-treesitter-parsers.clojure
      nvim-treesitter-parsers.markdown
      nvim-treesitter-parsers.yaml
      nvim-treesitter-parsers.dhall
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.gitcommit
      nvim-treesitter-parsers.gitignore
      nvim-treesitter-parsers.mermaid
      nvim-treesitter-parsers.elixir
      nvim-treesitter-parsers.rust
      rainbow-delimiters-nvim
      nvim-treesitter-textobjects
      # vim-ledger
      myPlugins.masser # Custom ftplugins
      myPlugins.vim-haskell-indent
      myPlugins.nerdtree
      myPlugins.vim-gnupg
      myPlugins.vim-gutentags
      myPlugins.d2-vim
    ];
    opt = [
      # There is a couple of definitions defined in the aicompl.lua file. They provide the user command
      # `:EnableCopilot`.
      copilot-vim
      windsurf-nvim

    ];
  };
  customRC = with builtins;
  let
    nix-env = with pkgs; runCommand "nix-environment.lua" { codeium = codeium; }
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
    " luafile ${./vimrc/obsidian.lua}
    luafile ${./vimrc/aicompl.lua}
    luafile ${./vimrc/which-key.lua}
    luafile ${./vimrc/treesitter.lua}
    luafile ${./vimrc/image.lua}
    luafile ${./vimrc/diagram.lua}
    luafile ${./vimrc/surround.lua}
    luafile ${./vimrc/lualine.lua}
    luafile ${./vimrc/zk.lua}
  '';
}
