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

  # External tool required for things to work
  hasktagging = pkgs.buildEnv {
    name ="hasktagging-complete";
    paths = with pkgs.haskell.lib;
    let
      hp = pkgs.haskellPackages.extend (self: super: {
        hasktagging = justStaticExecutables (self.callPackage ./hasktagging {});
        hasktags = justStaticExecutables (super.hasktags);
      });
    in
    [
      hp.hasktagging
      hp.hasktags
    ];
  };

in

pkgs.buildEnv {
  name = "vim-env";
  paths = [vimPkg hasktagging pkgs.nodejs];
}
