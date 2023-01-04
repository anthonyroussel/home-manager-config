{ config, ... }:

{
  systemd.user.tmpfiles.rules = [
    "d ${config.home.homeDirectory}/tmp - - - mM:7d"
    "d ${config.home.homeDirectory}/Downloads - - - mM:30d"
  ];
}
