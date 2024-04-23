{ mkShell, pkgs }:

mkShell { nativeBuildInputs = with pkgs; [ (buku.override { withServer = true; }) ]; }
