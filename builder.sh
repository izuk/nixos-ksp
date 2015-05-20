source $stdenv/setup

set -e

unzip $src -d $out

p=$out/KSP_linux

patchelf \
    --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
    --set-rpath $libPath \
    $p/KSP.x86_64
