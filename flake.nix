{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    # A minimal empty package definition
    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation rec {
      pname = "empty-package";  # Just a placeholder name
      version = "1.0.0";  # You can use any version you like
      src = null;  # No actual source code, so we set this to null
    };

    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = [
        nixpkgs.legacyPackages.x86_64-linux.haskellPackages.ghc
        nixpkgs.legacyPackages.x86_64-linux.haskellPackages.cabal-install
      ];

      shellHook = ''
        echo "You have entered the development shell!"
        echo "GHC version:"
        ghc --version
        cabal update 
        echo "cabal updated"
      '';
    };
  };
}
