{ mkShell, pkgs }:

mkShell { packages = with pkgs; [ go ]; }
