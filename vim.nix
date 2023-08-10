{pkgs, vim_configurable, inputs, ...}:

let
  customizations = pkgs.callPackage ./customization.nix { inherit inputs; };

  vimPkg = ((vim_configurable.override {}).customize {
    name = "vim";
    vimrcConfig.customRC = ''
      ${customizations.customRC}
    '';
    vimrcConfig.packages.myVimPackage = customizations.plugins;
  });

in

  vimPkg
