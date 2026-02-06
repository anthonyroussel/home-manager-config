{ mkShell, pkgs }:

mkShell {
  packages = with pkgs; [
    go
    golangci-lint
    gopls
    goreleaser
  ];
}
