{pkgs, vim_configurable, ...}:

let
  customizations = pkgs.callPackage ./customization.nix {};

  vimPkg = ((vim_configurable.override {}).customize {
    name = "vim";
    vimrcConfig.customRC = ''
      ${customizations.customRC}
    '';
    vimrcConfig.packages.myVimPackage = customizations.plugins;
  });

  # External tool required for things to work
  hasktagging = pkgs.buildEnv {
    name ="hasktagging-complete";
    paths = with pkgs.haskellPackages; [ (callPackage ./hasktagging {}) hasktags pkgs.ctags ];
  };

in

pkgs.buildEnv {
  name = "vim-env";
  paths = [vimPkg hasktagging];
}
