{ pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
  };

  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/solarflare.yaml";

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/wallpapers/NixOS-Gradient-grey.png";
      hash = "sha256-Tf4Xruf608hpl7YwL4Mq9l9egBOCN+W4KFKnqrgosLE=";
    };

    polarity = "dark";

    opacity = {
      terminal = 0.90;
      applications = 0.90;
      popups = 0.50;
      desktop = 0.90;
    };

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
        terminal = 14;
      };
    };

    targets = {
      vscode.enable = false;
    };

    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 32;
    };
  };
}
