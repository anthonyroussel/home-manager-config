{ inputs, lib, ... }:

{
  perSystem =
    { inputs', pkgs, ... }:
    {
      devShells = pkgs.callPackage ./default.nix { };
    };
}
