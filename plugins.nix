{pkgs, lib, fetchgit, dhallToNix}:

let
  buildvimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
  pluginsList = dhallToNix "${./plugins}/plugins.dhall";
  toPlugin = with lib; meta: buildvimPlugin {
    name = "${meta.name}";
    src = fetchgit { inherit (importJSON (./plugins + "/${meta.name}.json")) url rev sha256 fetchSubmodules; };
    dependencies = meta.dependencies;
  };
  plugins = with lib; listToAttrs (map (meta: {name = meta.name; value = toPlugin meta; }) pluginsList);

in
plugins //
rec {
  # Templates for xptemplate
  "customtemplates" = buildvimPlugin {
    name = "customtemplates";
    src = ./templates;
  };
}
