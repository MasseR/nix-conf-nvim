{pkgs ? import <nixpkgs> {}, ...}:

let
  customizations = pkgs.callPackage ./customization.nix {};
  gvimRC = ''
    if(has('gui_running'))
      set guioptions=
      set guifont=Iosevka\ Term\ 11
    endif
  '';

in

pkgs.vim_configurable.customize {
  name = "vim";
  vimrcConfig.customRC = ''
    ${customizations.customRC}

    ${gvimRC}
    '';
  vimrcConfig.packages.myVimPackage = customizations.plugins;
}
