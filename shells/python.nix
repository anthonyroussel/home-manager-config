{ mkShell, pkgs }:

mkShell { nativeBuildInputs = with pkgs; [ poetry ]; }
