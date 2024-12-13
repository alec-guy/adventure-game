let 
myHash = fetchTarball {
    url    = "https://github.com/alec-guy/adventure-game/archive/refs/tags/WOW.tar.gz";
    sha256 = "";
};
in 
myHash.sha256