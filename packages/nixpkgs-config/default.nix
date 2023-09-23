{ lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "android-studio-stable"
    "discord"
    "google-chrome"
    "microsoft-edge-stable"
    "shadow-prod"
    "spotify-unwrapped"
    "spotify"
    "vscode-extension-github-codespaces"
    "vscode-extension-ms-vscode-remote-remote-containers"
    "vscode-extension-ms-vsliveshare-vsliveshare"
    "vscode"
  ];
  xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs-config.nix;
}
