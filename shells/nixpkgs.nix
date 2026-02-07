{ mkShell, pkgs }:

mkShell {
  packages = with pkgs; [
    bundix
    hydra-check
    nix-init
    nixfmt
    nixpkgs-hammering
    (nixpkgs-review.override {
      withSandboxSupport = true;
      withNom = true;
    })
    nix-diff
    nix-update
    # nixpkgs-review-checks
    nurl
  ];
}
