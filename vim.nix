{pkgs ? import <nixpkgs> {}, ...}:

let
  customizations = pkgs.callPackage ./customization.nix {};
  gvimRC = ''
    if(has('gui_running'))
      set guioptions=
      set guifont=Iosevka\ 11
      let g:gtk_nocache=[0x00000000, 0xfc00ffff, 0xf8000001, 0x78000001]
    endif
  '';

  vimPkg = pkgs.vim_configurable.customize {
    name = "vim";
    vimrcConfig.customRC = ''
      ${customizations.customRC}

      ${gvimRC}
      '';
    vimrcConfig.packages.myVimPackage = customizations.plugins;
  };

in

pkgs.buildEnv {
  name = "vim-env";
  paths = [pkgs.haskellPackages.stylish-haskell vimPkg];
}
