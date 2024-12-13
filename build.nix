{
    stdenv, haskellPackages, fetchFromGitHub, pkgs
}:

stdenv.mkDerivation rec {
    name = "adventure-game";
    version = "1.0.0";
    src = fetchFromGitHub {
        owner = "alec-guy"; 
        repo = "adventure-game"; 
        rev  = "master"; 
        sha256 = ""; 

    };
    buildInputs = [haskell.compiler.ghc910 haskellPackages.cabal-install haskellPackages.GLUT]; 

    buildPhase = "cabal build" 
    installPhase = 
            "mkdir -p $out/bin" + 
                    "cp -r dist-newstyle/build/adventure-game/ $out/bin/";

    shellHook = "echo \"Installation complete.\"";



}