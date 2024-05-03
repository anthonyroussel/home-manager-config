{ inputs, lib, ... }:

{
  perSystem =
    {
      inputs',
      pkgs,
      system,
      ...
    }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "terraform" ];
      };

      devShells = pkgs.callPackage ./default.nix { };
    };
}
