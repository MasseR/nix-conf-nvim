{pkgs ? import <nixpkgs> {}, ...}:

let
  customizations = pkgs.callPackage ./customization.nix {};

  config = {
    packages.myVimPackages = customizations.plugins;
    customRC = customizations.customRC;
  };

in

pkgs.neovim.override {
  vimAlias = false;
  configure = config;
}
