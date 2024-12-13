let 
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz"; 
    sha256 = "1lr1h35prqkd1mkmzriwlpvxcb34kmhc9dnr48gkm8hh089hifmx";
  }) {};
  stdenv = pkgs.stdenv;
  haskellPackages = pkgs.haskellPackages;
in
stdenv.mkDerivation rec {
  name = "adventure-game";
  version = "1.0.0";
  
  # Correctly fetch the source from GitHub and add the sha256
  src = pkgs.fetchFromGitHub {
    owner = "alec-guy";
    repo  = "adventure-game";
    rev  = "WOW";
    sha256 = "...";  # Replace with actual sha256 hash after running nix-build once
  };
  
  buildInputs = [haskellPackages.cabal-install haskellPackages.GLUT];

  buildPhase = "cabal build";

  installPhase = ''
    mkdir -p $out/bin

    # Find the executable binary in the dist-newstyle directory
    executable=$(find dist-newstyle -type f -name 'adventure-game' | head -n 1)

    # Copy the executable to the $out/bin directory
    cp $executable $out/bin/
  '';

  shellHook = "echo \"Installation complete.\"";
}
