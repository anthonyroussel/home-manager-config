{ mkShell, pkgs }:

mkShell {
  packages = with pkgs; [
    mediainfo
    mkvtoolnix
  ];
}
