source $stdenv/setup

set -e

unzip $src -d $out

p=$out/KSP_linux

for bin in KSP.x86_64 Launcher.x86_64
do
  patchelf \
      --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
      --set-rpath $libPath \
      $p/$bin
done
