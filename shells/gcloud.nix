{ mkShell, pkgs }:

mkShell { packages = with pkgs; [ google-cloud-sdk ]; }
