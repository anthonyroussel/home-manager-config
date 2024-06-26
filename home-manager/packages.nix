{ inputs, pkgs, ... }:

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
  # Packages that should be installed to the user profile.
  home.packages =
    (with pkgs; [
      acpi
      anki
      bintools
      bruno
      calibre
      chezmoi
      devenv
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
      inputs.nur.packages."${pkgs.system}".shadow-prod
      jetbrains.ruby-mine
      jetbrains.webstorm
      killall
      libreoffice
      libsForQt5.gwenview
      libwebp
      lm_sensors
      mdcat
      mplayer
      mpv
      mupdf
      nix
      nix-health
      nvtopPackages.full
      oath-toolkit
      p7zip
      pcsx2
      podman
      powerline-fonts
      protonvpn-cli
      protonvpn-gui
      pup
      rclone
      simplescreenrecorder
      sops
      sox
      starship
      steam-tui
      steamguard-cli
      tig
      tomb
      topgrade
      transmission-qt
      tree
      unzip
      upscayl
      vlc
      whatsapp-for-linux
      xclip
      yq-go
      zbar
      zellij
    ])
    ++ aws
    ++ databases
    ++ networking;
}
