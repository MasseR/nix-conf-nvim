{pkgs, lib, fetchgit, dhallToNix, inputs}:

let
  buildvimPlugin = pkgs.vimUtils.buildVimPlugin;
  toPlugin = name: value:
    buildvimPlugin {
      pname = "${name}";
      version = "${value.rev}";
      src = value;
      dependencies = [];
  };
  sources = {
    inherit (inputs)
    nerdtree
    vim-gnupg
    vim-gutentags
    vim-lsp
    vim-haskell-indent
    d2-vim;
  };
  plugins = with lib;
    listToAttrs (mapAttrsToList (name: value: { name = name; value = toPlugin name value; }) sources);

in
plugins //
{
  # Configuration as a plugin
  # This allows me to use ftplugin as it's meant to be used
  # without having to play around with autocmds
  "masser" = buildvimPlugin {
    pname = "masser";
    version = "0.0.1";
    src = ./masser;

  };
  # vim-lsp-custom = buildvimPlugin {
  #   name = "vim-lsp";
  #   src = /home/masse/git/vim-lsp;
  # };
}
