{ pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
  };

  stylix = {
    image = ./NixOS-Gradient-grey.png;
    polarity = "dark";

    fonts = {
      serif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };

      sansSerif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };

      monospace = {
        name = "Fira Code";
        package = pkgs.fira-code;
      };

      sizes = {
        applications = 11;
        desktop = 11;
      };
    };
  };
}
