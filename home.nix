{ pkgs, config, ... }:

{
  imports = [
    ./packages.nix
    ./packages/awscli
    ./packages/borg
    ./packages/brave
    ./packages/chrome
    ./packages/desktop
    ./packages/direnv
    ./packages/firefox
    ./packages/git
    ./packages/gpg
    ./packages/jq
    ./packages/nix
    ./packages/nixpkgs-config
    ./packages/opengl
    ./packages/openstack
    ./packages/sops
    ./packages/ssh
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

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
