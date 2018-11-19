{ pkgs ? import <nixpkgs> {} }:

{
  vim = pkgs.callPackage ./vim.nix {};
  neovim = pkgs.callPackage ./neovim.nix {};
}
