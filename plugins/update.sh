#!/usr/bin/env nix-shell
#! nix-shell -i bash -p dhall-simple -p nix-prefetch-git
# shellcheck shell=bash

function prefetch() {
  name="$1"
  url="$2"

  nix-prefetch-git "${url}" > "${name}.json" &
}

rm *.json

eval "$(dhall text < ./plugin_eval.dhall)"

wait

echo "Done"
