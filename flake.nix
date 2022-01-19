{
  description = "A very basic flake";

  inputs = {
    # It's impure, can't use it as is
    # easy-dhall-nix = { url = "github:justinwoo/easy-dhall-nix"; flake = false; };
    flake-utils.url = "github:numtide/flake-utils";

    vim-gutentags = {
      url = "github:ludovicchabant/vim-gutentags";
      flake = false;
    };
    vim-unimpaired = {
      url = "github:tpope/vim-unimpaired";
      flake = false;
    };

    tcomment_vim = {
      url = "github:tomtom/tcomment_vim";
      flake = false;
    };
    syntastic = {
      url = "github:scrooloose/syntastic";
      flake = false;
    };
    xmledit = {
      url = "github:sukima/xmledit";
      flake = false;
    };
    nerdtree = {
      url = "github:scrooloose/nerdtree";
      flake = false;
    };
    vim-haskell-indent = {
      url = "github:itchyny/vim-haskell-indent";
      flake = false;
    };
    vim-trailing-whitespace = {
      url = "github:bronson/vim-trailing-whitespace";
      flake = false;
    };
    vim-gnupg = {
      url = "github:jamessan/vim-gnupg";
      flake = false;
    };
    vim-lsp = {
      url = "github:MasseR/vim-lsp";
      flake = false;
    };
    vim-ledger = {
      url = "github:gregorias/vim-ledger";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... } @ inputs: {

    overlay = final: prev: {
      myVim = final.callPackage ./vim.nix { inherit inputs; };
    };
  }
  //
  flake-utils.lib.eachSystem ["x86_64-linux"] (system:
  let pkgs = import nixpkgs { inherit system; overlays = [ self.overlay ]; };
  in
  rec {
    packages = { inherit (pkgs) myVim; };
    defaultPackage = packages.myVim;
    apps.vim = flake-utils.lib.mkApp { drv = packages.myVim; exePath = "/bin/vim"; };
    defaultApp = apps.vim;
    devShell = with pkgs; mkShell {
      buildInputs = [
        dhall
        dhall-lsp-server
      ];
    };
  }
  );

}
