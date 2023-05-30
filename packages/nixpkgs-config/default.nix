{ lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "google-chrome"
    "slack"
    "android-studio-stable"
    "vscode"
    "spotify"
    "spotify-unwrapped"
    "microsoft-edge-stable"
    "discord"
    "shadow-prod"
    "vscode-extension-github-codespaces"
    "vscode-extension-ms-vsliveshare-vsliveshare"
  ];
  xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs-config.nix;
}
