{ mkShell, pkgs }:

mkShell {
  packages = with pkgs; [
    bundix
    hydra-check
    nixfmt-rfc-style
    nixpkgs-hammering
    (nixpkgs-review.override {
      withSandboxSupport = true;
      withNom = true;
    })
    # nixpkgs-review-checks
  ];
}
