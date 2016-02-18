with import <nixpkgs> {};

assert stdenv.system == "x86_64-linux";

stdenv.mkDerivation {

  name = "ksp-linux-1.0.5";

  src = fetchurl {
    name = "ksp-linux-1-0-5.zip";
    sha256 = "0i5rqlplz6d49qcsl7r14472699mlzgmg42pidg36ixlwa41s7g5";
  };

  libPath = stdenv.lib.makeLibraryPath [
    stdenv.cc.cc
    mesa
    libpulseaudio
    xlibs.libX11
    xlibs.libXext
    xlibs.libXcursor
    xlibs.libXrandr
    ];
  
  buildInputs = [ unzip ];

  builder = ./builder.sh;

  meta = {
    description = "Kerbal Space Program";
    license = stdenv.lib.licenses.unfree;
  };
}
