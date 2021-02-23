{ pkgs ? import <nixpkgs> {} }:

{
  vim = pkgs.callPackage ./vim.nix {};
}
