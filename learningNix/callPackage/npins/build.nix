{stdenv, lib}: 
let 
  fs = lib.fileset; 
  sourceFiles = ./.;
in 
fs.trace sourceFiles 

stdenv.mkDerivation {
    name = "fileset";
    src = fs.toSource {
        root = ./.; 
        fileset = sourceFiles; 
    }; 
    postInstall = "mkdir $out\n"  + "cp -v {hello,world}.txt $out";
}