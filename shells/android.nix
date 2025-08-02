{ mkShell, pkgs }:

mkShell {
  packages = with pkgs; [
    apktool
    jadx
    dotnet-sdk
    dotnet-runtime
    mono # Unity based Android games
  ];
}
