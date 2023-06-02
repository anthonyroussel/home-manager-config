{ pkgs, config, ... }:

let
  aws = with pkgs; [
    awscli2
    awsebcli
    eksctl
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

in
{
  imports = [
    ./packages/chrome
    ./packages/desktop
    ./packages/direnv
    ./packages/git
    ./packages/gpg
    ./packages/jq
    ./packages/nixpkgs-config
    ./packages/opengl
    ./packages/topgrade
    ./packages/tmpfiles
    ./packages/tmux
    ./packages/vim
    ./packages/vscode
    ./packages/xdg
    ./packages/xsession
    ./packages/zsh
  ];

  # Packages that should be installed to the user profile.
  home.packages = (with pkgs; [
    neovim
    powerline-fonts

    podman
    slack
    gimp
    inkscape
    oath-toolkit
    xclip
    chezmoi
    gopass
    zbar
    translate-shell
    sox
    mpv
    espeak
    mplayer
    sops
    acpi
    topgrade
    ripgrep
    pup
    mdcat
    yq-go
    gnupg
    # https://github.com/zellij-org/zellij
    zellij
    tig
    openssh
    steampipe
    discord
    whatsapp-for-linux
    nixpkgs-fmt
    nix

    config.nur.repos.anthonyroussel.shadow-prod
    nixpkgs-review

    calibre
    starship
  ]) ++ aws ++ browsers ++ databases ++ networking;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
