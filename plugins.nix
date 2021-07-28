{pkgs, lib, fetchgit, dhallToNix}:

let
  buildvimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
  pluginsList = dhallToNix "toMap ${./plugins}/plugins.dhall";
  toPlugin = with lib; meta: buildvimPlugin {
    name = "${meta.name}";
    src = fetchgit {
      inherit (importJSON (./plugins + "/${meta.name}.json")) url rev sha256 fetchSubmodules;
    };
    dependencies = meta.plugin.dependencies;
  };
  fromDhallPlugin = meta: { name = meta.mapKey; plugin = meta.mapValue; };
  plugins = with lib;
  listToAttrs
    ( map (meta: {name = meta.mapKey; value = toPlugin (fromDhallPlugin meta); }) pluginsList );

in
plugins //
rec {
  # Configuration as a plugin
  # This allows me to use ftplugin as it's meant to be used
  # without having to play around with autocmds
  "masser" = buildvimPlugin {
    name = "masser";
    src = ./masser;
  };
}
