{
    stdenv, haskellPackages, fetchFromGitHub, pkgs
}:

stdenv.mkDerivation rec {
    name = "adventure-game";
    version = "1.0.0";
    src = "/mnt/c/Users/alecb/haskellProjects/adventure-game"
    buildInputs = [haskell.compiler.ghc910 haskellPackages.cabal-install haskellPackages.GLUT]; 

    buildPhase = "cabal build" 
    installPhase = "mkdir -p $out/bin";

    shellHook = "echo \"Installation complete.\"";



}