{ lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "android-studio-stable"
      "cudatoolkit"
      "discord"
      "google-chrome"
      "microsoft-edge-stable"
      "ruby-mine"
      "shadow-prod"
      "spotify-unwrapped"
      "spotify"
      "steam"
      "steamcmd"
      "steam-original"
      "steam-run"
      "vscode-extension-github-codespaces"
      "vscode-extension-ms-vscode-remote-remote-containers"
      "vscode-extension-ms-vsliveshare-vsliveshare"
      "vscode"
      "webstorm"
    ];
  xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs-config.nix;
}
