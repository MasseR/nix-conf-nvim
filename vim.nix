{pkgs ? import <nixpkgs> {}, ...}:

let
  customizations = pkgs.callPackage ./customization.nix {};

in

pkgs.vim_configurable.customize {
  name = "vim";
  vimrcConfig.customRC = customizations.customRC;
  vimrcConfig.packages.myVimPackage = customizations.plugins;
  # extraPython3Packages = [ tasklib ];
}
