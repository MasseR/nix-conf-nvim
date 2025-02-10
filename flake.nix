{
  description = "A very basic flake";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    # It's impure, can't use it as is
    # easy-dhall-nix = { url = "github:justinwoo/easy-dhall-nix"; flake = false; };
    flake-utils.url = "github:numtide/flake-utils";

    vim-gutentags = {
      url = "github:ludovicchabant/vim-gutentags";
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
    vim-gnupg = {
      url = "github:jamessan/vim-gnupg";
      flake = false;
    };
    nvim-codeium = {
      url = "github:Exafunction/codeium.nvim";
      flake = false;
    };
    d2-vim = {
      url = "github:terrastruct/d2-vim";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... } @ inputs: {

    overlay = final: prev:
    let neovim = final.callPackage ./neovim.nix { inherit inputs; };
    in {
      myVim = neovim.vimPkg;
      haskellPackages = prev.haskellPackages.override ( old: {
        overrides = with prev.haskell.lib; final.lib.composeExtensions ( old.overrides or (_: _: {})) (f: p: {
          hasktagging = justStaticExecutables (f.callPackage ./hasktagging {});
          hasktags = justStaticExecutables prev.hasktags;
        });
      });
    };
  }
  //
  flake-utils.lib.eachSystem ["x86_64-linux"] (system:
  let pkgs = import nixpkgs { inherit system; overlays = [ self.overlay ]; };
  in
  rec {
    packages.myVim = pkgs.buildEnv {
      name = "myVim";
      paths = [pkgs.myVim packages.hasktagging];
    };
    packages.myVimQt = pkgs.buildEnv {
      name = "myVimQt";
      paths = [pkgs.myVimQt packages.hasktagging];
    };
    packages.hasktagging = pkgs.haskellPackages.hasktagging;
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
