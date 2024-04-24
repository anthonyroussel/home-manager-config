{ mkShell, pkgs }:

mkShell { packages = with pkgs; [ (buku.override { withServer = true; }) ]; }
