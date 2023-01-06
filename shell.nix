{ pkgs ? import <nixpkgs> {} }:
 with pkgs; let
  LD_LIBRARY_PATH = stdenv.lib.makeLibraryPath([
      stdenv.cc.cc.lib
      openssl
      dotnet-sdk
      "./Engine/Binaries/DotNET/GitDependencies/linux-x64/"
    ]);

in (buildFHSUserEnv rec {
  name = "x11-env";
  targetPkgs = pkgs: (with pkgs;
    [ udev
      alsa-lib
      mono
      dotnet-sdk
      llvmPackages_14.stdenv
      clang_14
      icu
      openssl
      zlib
      SDL2.dev
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers
      glib
      libxkbcommon
      nss
      nspr
      atk
      mesa
      dbus
      pango
      cairo
      xorg.libICE
      xorg.libSM
      xorg.libX11
      xorg.libxcb
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXrandr
      xorg.libXrender
      xorg.libXScrnSaver
      xorg.libxshmfence
      xorg.libXtst
    ]) ++ (with pkgs.xorg;
    [ libX11
      libXcursor
      libXrandr
    ]);
}).env
