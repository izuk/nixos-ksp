Nix Expression for Kerbal Space Program
=======================================

Prerequisites
-------------

* Only for 1.0.4.
* Only on x86_64.

Building
--------

Download the zip archive from kerbalspaceprogram.com and install it
into the Nix store with:

    nix-prefetch-url file:///path/to/ksp-linux-1-0-4.zip

If necessary, modify ksp.nix with the right sha256 hash.

Build with:

    nix-build ksp.nix

or install with:

    nix-env -f ksp.nix -i ksp-linux

Now you have KSP in the store, and KSP.x86_64 will run, but the store
is read-only and KSP doesn't like that.  So, copy everything
into a local tree:

    cp -r /nix/store/<hash>-ksp-linux-1.0.4/KSP_linux /path/to/games
    chmod -R ug+w /path/to/games/KSP_linux

Go ahead and run it:

    /path/to/games/KSP_linux/KSP.x86_64

The ksp.nix expression makes sure that the binary is linked with the
right libraries.  Installing it via nix-env means that those libraries
won't disappear when the system is upgraded, and that if KSP works
once, an upgrade won't trash those old, working libraries.

Optional
--------

Use dvorak.patch to update a settings.cfg to the Dvorak keyboard:

    cd /path/to/games/KSP_linux; patch </path/to/dvorak.patch
