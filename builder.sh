source $stdenv/setup

unzip $src -d $out

p=$out/KSP_linux

patchelf --interpreter "$(cat $NIX_GCC/nix-support/dynamic-linker)" \
    --set-rpath $libPath \
    $p/KSP.x86_64
