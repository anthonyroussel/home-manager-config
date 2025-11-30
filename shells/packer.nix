{ mkShell, pkgs }:

mkShell { packages = with pkgs; [ packer ]; }
