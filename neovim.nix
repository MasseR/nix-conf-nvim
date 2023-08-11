{pkgs, neovim, neovim-qt, inputs, ...}:

let
  customizations = pkgs.callPackage ./customization.nix { inherit inputs; };

  vimPkg = neovim.override {
    vimAlias = true;
    viAlias = true;
    configure = {
      customRC = ''
        ${customizations.customRC}
      '';
      packages.myVimPackage = customizations.plugins;
    };
  };
  qtvim = neovim-qt.override {
    neovim = vimPkg;
  };

in

  { inherit vimPkg qtvim; }

