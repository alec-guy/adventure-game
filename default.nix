{ pkgs ? import (builtins.fetchTarball "https://github.com/NixOS/nix/archive/refs/tags/2.25.3.tar.gz") {}}: 

pkgs.callPackage ./adventure-game {}