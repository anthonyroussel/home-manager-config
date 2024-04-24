{ mkShell, pkgs }:

mkShell { packages = with pkgs; [ rpi-imager ]; }
