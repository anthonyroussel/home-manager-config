{ pkgs, config, ... }:

let
  aws = with pkgs; [
    awsebcli
    eksctl
    s3cmd
    awslogs
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
    ./packages/awscli
    ./packages/brave
    ./packages/desktop
    ./packages/direnv
    ./packages/git
    ./packages/gpg
    ./packages/jq
    ./packages/nixpkgs-config
    ./packages/opengl
    ./packages/stylix
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
    acpi
    borgbackup
    calibre
    chezmoi
    devenv
    discord
    espeak
    file
    gimp
    gnupg
    gopass
    goss
    homebank
    httpie
    imagemagick
    inkscape
    killall
    mdcat
    mplayer
    mpv
    nix
    nixfmt
    nixpkgs-fmt
    nixpkgs-review
    nixpkgs-review-checks
    nvtop-intel
    oath-toolkit
    openssh
    p7zip
    podman
    powerline-fonts
    pup
    rclone
    sops
    sox
    starship
    steamguard-cli
    steampipe
    tig
    topgrade
    unzip
    whatsapp-for-linux
    xclip
    yq-go
    zbar
    zellij
  ]) ++ aws ++ databases ++ networking;

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
