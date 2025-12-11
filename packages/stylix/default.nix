{ pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Zafiro-icons-Dark";
      package = pkgs.zafiro-icons;
    };
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/solarflare.yaml";

    image = pkgs.fetchurl {
      url = "https://brand.nixos.org/logos/nixos-logo-default-gradient-white-regular-horizontal-recommended.svg";
      hash = "sha256-zCQDqFrqkJu/so4rCoblYJHEkPR8KiE1C1cKf7xqGZo=";
    };

    polarity = "dark";

    opacity = {
      terminal = 0.9;
      applications = 0.9;
      popups = 0.5;
      desktop = 0.9;
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

  home.keyboard = {
    layout = "fr";
    variant = ",";
  };
}
