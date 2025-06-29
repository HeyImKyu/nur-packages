# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

let
  python = pkgs.python3;
  fabric = pkgs.callPackage ./pkgs/fabric/fabric { python312Packages = python.pkgs; };
in
{
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  fabric-cli = pkgs.callPackage ./pkgs/fabric/fabric-cli { };
  fabric-gray = pkgs.callPackage ./pkgs/fabric/gray { inherit pkgs; };

  run-widget = pkgs.callPackage ./pkgs/fabric/run-widget {
    inherit fabric pkgs;
    python3 = python;
  };
}
