{ mkShell, pkgs }:

mkShell {
  packages = with pkgs; [
    (maven.override { jdk_headless = pkgs.jdk17; })
  ];
}
