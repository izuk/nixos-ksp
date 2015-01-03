with import <nixpkgs> {};

assert stdenv.system == "x86_64-linux";

stdenv.mkDerivation {
  name = "ksp-linux-0.90.0";
  
  src = fetchurl {
    name = "ksp-linux-0-90-0.zip";
    sha256 = "1h9rn2w8km8is5azi9b7gnz35323pwc67ms9y2kcc298vv6j5qd3";
  };

  builder = ./builder.sh;

  libPath = stdenv.lib.makeLibraryPath [
    stdenv.gcc.gcc
    xlibs.libX11 xlibs.libXext xlibs.libXcursor xlibs.libXrandr
    mesa
    ];
  
  buildInputs = [ unzip ];

  meta = {
    description = "Kerbal Space Program";
    license = stdenv.lib.licenses.unfree;
  };
}
