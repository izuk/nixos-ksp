with import <nixpkgs> {};

assert stdenv.system == "x86_64-linux";

stdenv.mkDerivation {

  name = "ksp-linux-1.2";

  src = requireFile {
    name = "ksp-linux-1-2.zip";
    sha256 = "15y5yj3wk0wnqi576498f4phpf9xx0pxq5wgfpjpn6af79p1nw51";
    url = "http://www.kerbalspaceprogram.com/";
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
