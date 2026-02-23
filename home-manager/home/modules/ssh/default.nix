{ config, sops, ... }:

let
  sshConfigPath = "${config.home.homeDirectory}/.ssh";
in
{
  sops.secrets = {
    "ssh/github" = {
      path = "${sshConfigPath}/keys/github";
      mode = "0400";
    };
    "ssh/aarch64-build-box" = {
      path = "${sshConfigPath}/keys/aarch64-build-box";
      mode = "0400";
    };
    "ssh/darwin-build-box" = {
      path = "${sshConfigPath}/keys/darwin-build-box";
      mode = "0400";
    };
    "ssh/maftehq" = {
      path = "${sshConfigPath}/keys/maftehq";
      mode = "0400";
    };
    "ssh/thaivek" = {
      path = "${sshConfigPath}/keys/thaivek";
      mode = "0400";
    };
    "ssh/lafourmiliere-benevolat" = {
      path = "${sshConfigPath}/keys/lafourmiliere-benevolat";
      mode = "0400";
    };
    "ssh/openstack-gerrit" = {
      path = "${sshConfigPath}/keys/openstack-gerrit";
      mode = "0400";
    };
  };

  programs.ssh = {
    enable = true;
    includes = [ "~/.ssh/config.d/*" ];
    enableDefaultConfig = false;
    matchBlocks = {
      "build-box.nix-community.org" = {
        user = "anthonyroussel";
        hostname = "build-box.nix-community.org";
        identityFile = config.sops.secrets."ssh/aarch64-build-box".path;
        identitiesOnly = true;
      };
      "darwin-build-box.nix-community.org" = {
        user = "anthonyroussel";
        hostname = "darwin-build-box.nix-community.org";
        identityFile = config.sops.secrets."ssh/darwin-build-box".path;
        identitiesOnly = true;
      };
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = config.sops.secrets."ssh/github".path;
        identitiesOnly = true;
      };
      "maftehq" = {
        user = "maftehq";
        hostname = "ftp.cluster029.hosting.ovh.net";
        identityFile = config.sops.secrets."ssh/maftehq".path;
        identitiesOnly = true;
      };
      "thaivek" = {
        user = "thaivek";
        hostname = "ftp.cluster029.hosting.ovh.net";
        identityFile = config.sops.secrets."ssh/thaivek".path;
        identitiesOnly = true;
      };
      "*.lafourmiliere-benevolat.fr" = {
        user = "aroussel";
        identityFile = config.sops.secrets."ssh/lafourmiliere-benevolat".path;
        identitiesOnly = true;
      };
      "review.opendev.org" = {
        host = "review.opendev.org";
        port = 29418;
        user = "anthonyrsl";
        identityFile = config.sops.secrets."ssh/openstack-gerrit".path;
      };
    };
  };
}
