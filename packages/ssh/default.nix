{
  config,
  sops,
  ...
}:

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
  };

  programs.ssh = {
    enable = true;
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
    };
  };
}
