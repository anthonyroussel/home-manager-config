{ pkgs, config, ... }:

let
  aws = with pkgs; [
    awsebcli
    aws-sso-cli
    eksctl
    s3cmd
    awslogs
  ];

  databases = with pkgs; [
    postgresql_16
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
    ./packages/firefox
    ./packages/git
    ./packages/gpg
    ./packages/jq
    ./packages/nixpkgs-config
    ./packages/opengl
    ./packages/openstack
    ./packages/sops
    ./packages/stylix
    ./packages/topgrade
    ./packages/tmpfiles
    ./packages/tmux
    ./packages/thunderbird
    ./packages/vim
    ./packages/vscode
    ./packages/xdg
    ./packages/xsession
    ./packages/zsh
  ];

  nix.package = pkgs.nix;

  # Packages that should be installed to the user profile.
  home.packages = (with pkgs; [
    acpi
    anki
    bintools
    borgbackup
    bruno
    calibre
    chezmoi
    discord
    dislocker
    espeak
    file
    filezilla
    ffmpeg-full
    gimp
    gopass
    goss
    homebank
    httpie
    hydra-check
    imagemagick
    inkscape
    jetbrains.ruby-mine
    jetbrains.webstorm
    killall
    libsForQt5.gwenview
    libwebp
    mdcat
    mplayer
    mpv
    mupdf
    nix
    nix-health
    nixfmt
    nixpkgs-fmt
    nixpkgs-hammering
    (nixpkgs-review.override {
      withSandboxSupport = true;
      withNom = true;
    })
    nixpkgs-review-checks
    nvtop
    oath-toolkit
    openssh
    p7zip
    pcsx2
    podman
    powerline-fonts
    protonvpn-cli
    protonvpn-gui
    pup
    rclone
    shadow-prod
    simplescreenrecorder
    sops
    sox
    starship
    steam-tui
    steamguard-cli
    steampipe
    tig
    tomb
    topgrade
    transmission-qt
    tree
    unzip
    upscayl
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
