{ config, ... }:

{
  systemd.user.tmpfiles.rules = [
    "e  ${config.home.homeDirectory}/tmp - - - 7d"
  ];
}
