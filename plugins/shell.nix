with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    dhall-simple
    dhall-lsp-simple
    dhall-bash-simple
  ];
}
