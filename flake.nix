{
  description = "A very basic flake";

  inputs = {
    # It's impure, can't use it as is
    # easy-dhall-nix = { url = "github:justinwoo/easy-dhall-nix"; flake = false; };
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.myVim = nixpkgs.legacyPackages.x86_64-linux.callPackage ./vim.nix {};
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.myVim;
    apps.x86_64-linux.myVim = {
      type = "app";
      program = "${self.packages.x86_64-linux.myVim}/bin/vim";
    };
    defaultApp.x86_64-linux = self.apps.x86_64-linux.myVim;

    devShell.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux; mkShell {
      buildInputs = [
        dhall
      ];
    };

  };
}
