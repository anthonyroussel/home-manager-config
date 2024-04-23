{ mkShell, pkgs }:

mkShell { nativeBuildInputs = with pkgs; [ google-cloud-sdk ]; }
