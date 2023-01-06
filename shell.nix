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
    ]) ++ (with pkgs.xorg;
    [ libX11
      libXcursor
      libXrandr
    ]);
}).env
