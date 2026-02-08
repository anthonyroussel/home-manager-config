{ mkShell, pkgs }:

mkShell {
  packages = with pkgs; [
    bundix
    hydra-check
    nix-init
    nixfmt
    nixpkgs-hammering
    nixpkgs-reviewFull
    nix-diff
    nix-update
    # nixpkgs-review-checks
    nurl
  ];
}
