{ pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
  };

  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/solarflare.yaml";

    image = pkgs.fetchurl {
      url = "https://cdnb.artstation.com/p/assets/images/images/016/252/301/4k/grady-frederick-atlantis-garbageman-v2.jpg";
      hash = "sha256-J4CCXMV698POytE0HAxjOlBW7mO+uSr+Fqy585G/LF8=";
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
