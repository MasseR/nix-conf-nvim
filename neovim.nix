{pkgs ? import <nixpkgs> {}, ...}:

let
  tasklib = pkgs.python3Packages.buildPythonPackage {
    pname = "tasklib";
    version = "1.0.0";
    propagatedBuildInputs = with pkgs.python3Packages; [
      pytz
      tzlocal
      six
    ];
    doCheck = false;
    src = pkgs.fetchFromGitHub {
      owner = "tbabej";
      repo = "tasklib";
      rev = "e75e49f86808bf78d12fd8df0aeceab426f947f1";
      sha256 = "1zrwa1ql9q8qkc756y1hn3x0pj4va1sq8gdrm56dpfp1m7wr4h4r";
    };
  };

  customizations = pkgs.callPackage ./customization.nix {};

  config = {
    packages.myVimPackages = customizations.plugins;
    customRC = customizations.customRC;
  };

in

pkgs.neovim.override {
  vimAlias = false;
  configure = config;
  extraPython3Packages = [ tasklib ];
}
