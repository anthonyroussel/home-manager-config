{ pkgs, config, ... }:

{
  imports = [
    ./packages.nix
    ./modules/awscli
    ./modules/borg
    ./modules/gpg
    ./modules/openstack
    ./modules/ssh
    ./modules/thunderbird
  ];

  rsl.hm-git = {
    enable = true;
    userName = "Anthony ROUSSEL";
    userEmail = "anthony@roussel.dev";
    signingKey = "472D368AF107F443F3A5C7129DC4987B1A55E75E";
  };

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
