{
    stdenv, haskell, fetchFromGitHub, pkgs
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
    buildInputs = [haskell.compiler.ghc910]; 
    
    buildPhase = "cabal build\n" + "cabal run"
    installPhase = 
            "mkdir -p $out/bin" + 
                    "cp -r dist/build/adventure-game/adventure-game $out/bin/";

    shellHook = "echo \"Installation complete.\"";



}