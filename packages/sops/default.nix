{
  pkgs,
  config,
  home,
  inputs,
  ...
}:

{
  home.packages = [
    pkgs.age
    pkgs.sops
  ];

  sops = {
    age = {
      # This is using an age key that is expected to already be in the filesystem
      keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
      # This will generate a new key if the key specified above does not exist
      generateKey = true;
    };
    defaultSopsFile = "${inputs.nix-secrets}/hm/${config.home.username}.yaml";
  };
}
