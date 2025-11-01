{ inputs, pkgs, ... }:

let
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
      transmission_4-qt
      tree
      unzip
      upscayl
      vlc
      xclip
      yq-go
      zbar
      zellij
    ])
    ++ databases
    ++ networking;
}
