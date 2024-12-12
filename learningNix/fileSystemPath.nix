let 
 pkgs = import <nixpkgs> {}; 

in ${pkgs.nix}

'' 
The example imports the Nix expression from the lookup path <nixpkgs>, and applies the resulting function to an empty attribute set {}. Its output is assigned the name pkgs.

Converting the attribute pkgs.nix to a string with string interpolation is allowed, as pkgs.nix is a derivation. That is, ultimately pkgs.nix boils down to a call to derivation.

The resulting string is the file system path where the build result of that derivation will end up.

There is more depth to the inner workings of derivations, but at this point it should be enough to know that such expressions evaluate to Nix store paths.

''