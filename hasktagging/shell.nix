{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let hp = haskellPackages.extend (haskell.lib.packageSourceOverrides {
      hasktagging = ./.;
    });
    shell = hp.ghcWithPackages (hp: with hp; hasktagging.buildInputs ++ hasktagging.nativeBuildInputs);

in

buildEnv {
  name = "shell";
  paths = [];
  buildInputs = [haskellPackages.ghcid haskellPackages.hasktags haskellPackages.cabal-install shell];
}
