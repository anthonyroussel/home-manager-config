{ mkShell, pkgs }:

mkShell { nativeBuildInputs = with pkgs; [ rpi-imager ]; }
