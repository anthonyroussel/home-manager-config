# Duplicate of nixpkgs-config-home.nix to avoid errors during home-manager switch
#
# > error: anonymous functioncalled without required argument 'lib'
#
{ lib, ... }:

{
  allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
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
}
