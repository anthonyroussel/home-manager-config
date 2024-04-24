{ mkShell, pkgs }:

mkShell { packages = with pkgs; [ poetry ]; }
