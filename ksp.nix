with import <nixpkgs> {};

assert stdenv.system == "x86_64-linux";

stdenv.mkDerivation {

  name = "ksp-linux-1.0.4";

  src = fetchurl {
    name = "ksp-linux-1-0-4.zip";
    sha256 = "1alpch8l3chs1j34bnrmr86msf8xj24wvm4dalx1m09dq93bzg2y";
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
