{ mkShell, pkgs }:

mkShell { packages = with pkgs; [ ventoy-full ]; }
