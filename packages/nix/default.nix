{
  config,
  inputs,
  pkgs,
  ...
}:

{
  sops.secrets."nix/access-tokens" = {
    path = "${config.home.homeDirectory}/.config/nix/access-tokens.nix";
    mode = "0440";
  };

  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      sandbox = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    extraOptions = ''
      !include ${config.sops.secrets."nix/access-tokens".path}
    '';

    registry = {
      nixpkgs.flake = inputs.nixpkgs;
      nur.flake = inputs.nur;
    };
  };
}
