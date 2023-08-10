{pkgs, neovim, inputs, ...}:

let
  customizations = pkgs.callPackage ./customization.nix { inherit inputs; };

  vimPkg = neovim.override {
    configure = {
      customRC = ''
        ${customizations.customRC}
      '';
      packages.myVimPackage = customizations.plugins;
    };
  };

in

  vimPkg

