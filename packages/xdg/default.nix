{ config, pkgs, ... }:

{
  xdg = {
    enable = true;
    # Add $HOME/.nix-profile/share to XDG_DATA_DIRS
    systemDirs.data = [
      # Nix profiles
      "\${NIX_STATE_DIR:-/nix/var/nix}/profiles/default/share"
      "${config.home.profileDirectory}/share"

      # Distribution-specific
      "/usr/local/share"
      "/usr/share"
      "/var/lib/snapd/desktop"
    ];
    mime = {
      enable = true;
    };
    mimeApps = {
      enable = true;
      defaultApplicationPackages = with pkgs; [
        chromium
        libreoffice
        thunderbird
        transmission_4-qt
        vlc
        vscode
        inkscape
        gimp
      ];
    };
  };
}
