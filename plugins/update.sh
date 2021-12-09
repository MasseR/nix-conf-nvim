#!/usr/bin/env nix-shell
#! nix-shell -i bash -p dhall-bash -p dhall -p nix-prefetch-git
# shellcheck shell=bash

function prefetch() {
  name="$1"
  url="$2"

  nix-prefetch-git "${url}" > "${name}.json" &
}

eval "$(dhall-to-bash --declare PLUGINS <<< './plugin_names.dhall')"

rm ./*.json

for plugin in "${PLUGINS[@]}"; do
  eval "url=$(dhall-to-bash <<< "(./plugins.dhall).$plugin.url")"
  prefetch "$plugin" "$url"
done

wait

echo "Done"
