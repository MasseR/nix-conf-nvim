{
  description = "A very basic flake";

  inputs = {
    # It's impure, can't use it as is
    # easy-dhall-nix = { url = "github:justinwoo/easy-dhall-nix"; flake = false; };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: {

    overlay = final: prev: {
      myVim = final.callPackage ./vim.nix {};
    };
  }
  //
  flake-utils.lib.eachSystem ["x86_64-linux"] (system:
  let pkgs = import nixpkgs { inherit system; overlays = [ self.overlay ]; };
  in
  rec {
    packages = { inherit (pkgs) myVim; };
    defaultPackage = packages.myVim;
    devShell = with pkgs; mkShell {
      buildInputs = [
        dhall
        dhall-lsp-server
      ];
    };
  }
  );

}
