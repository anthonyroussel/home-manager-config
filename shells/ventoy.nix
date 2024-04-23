{ mkShell, pkgs }:

mkShell { nativeBuildInputs = with pkgs; [ ventoy-full ]; }
