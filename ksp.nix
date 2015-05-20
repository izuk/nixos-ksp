with import <nixpkgs> {};

assert stdenv.system == "x86_64-linux";

stdenv.mkDerivation {

  name = "ksp-linux-1.0.2";

  src = fetchurl {
    name = "ksp-linux-1-0-2.zip";
    sha256 = "0qb1si0ns731ribb84chz6csjlfc6sc7rli4v1hx84ffx3lq5rpd";
  };

  libPath = stdenv.lib.makeLibraryPath [
    stdenv.cc.cc
    mesa
    pulseaudio
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
