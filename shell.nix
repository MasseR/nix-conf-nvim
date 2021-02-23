with (import <nixpkgs> {});

let
  easy-dhall-nix = with builtins;
      fetchgit { inherit (fromJSON (readFile ./easy-dhall-nix.json)) url rev sha256 fetchSubmodules; };
  myVim = callPackage ./default.nix {};

in

mkShell {
  buildInputs = with easy-dhall-nix; [
    myVim.vim
    dhall-simple
    dhall-lsp-simple
  ];
}
