{ config, pkgs, lib, ... }:

let
  aws = with pkgs; [
    awscli2
    awsebcli
    eksctl
    nodePackages.aws-cdk
    s3cmd
  ];

  browsers = with pkgs; [
    firefox
    microsoft-edge
  ];

  databases = with pkgs; [
    postgresql
    redis
    usql
  ];

  networking = with pkgs; [
    dig
    mtr
    nload
  ];

in {
  imports = [
    ./packages/chrome
    ./packages/desktop
    ./packages/direnv
    ./packages/home-manager
    ./packages/gpg-agent
    ./packages/nixpkgs-config
    ./packages/opengl
    ./packages/tmpfiles
    ./packages/vscode
    ./packages/xdg
    ./packages/xsession
    ./packages/zsh
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "aroussel";
  home.homeDirectory = "/home/aroussel";

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Packages that should be installed to the user profile.
  home.packages = (with pkgs; [
    slack
    gimp
    libreoffice
    inkscape
    oath-toolkit
    xclip
    chezmoi
    gopass
    jq
    zbar
    translate-shell
    sox
    mpv
    espeak
    mplayer
    sops
    gh
    topgrade
    ripgrep
    pup
    mdcat
    yq-go
    gnupg
  ]) ++ aws ++ browsers ++ databases ++ networking;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
