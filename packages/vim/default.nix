{ lib, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    settings = {
      tabstop = 2;
    };
  };
}
