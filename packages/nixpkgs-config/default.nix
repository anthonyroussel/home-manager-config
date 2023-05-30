{ lib, ... }:

{
  nixpkgs.config = import ./nixpkgs-config.nix { inherit lib; };
  home.file.".config/nixpkgs/config.nix".source = ./nixpkgs-config-home.nix;
}
