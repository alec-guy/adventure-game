{ mkDerivation, base, gloss, lib, fetchFromGitHub}:
mkDerivation {
  pname = "adventure-game";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "alec-guy";
    repo  = "adventure-game";
    rev  = "WOW";
    sha256 = "0qpn3dih1jpiy4nrg1260vb87wqjjrxfr6jl7sd3mjbxb5mxgwrg";  # Replace with actual sha256 hash after running nix-build once
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base gloss ];
  license = lib.licenses.bsd3;
  mainProgram = "adventure-game";
}
