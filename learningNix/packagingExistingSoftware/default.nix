# default.nix 
let  
  nixpkgs = fetchTarball "http://github.com/NixOS/nixpkgs/tarball/nixos-24.05"; 
  pkgs    = import nixpkgs {config = {}; overlays = [];}; 

in 
{
    packageFunction = pkgs.callPackage ./packageFunction.nix {}; 
    icat            = pkgs.callPackage ./icat.nix {};

}
