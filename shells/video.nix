{ mkShell, pkgs }:

mkShell {
  nativeBuildInputs = with pkgs; [
    mediainfo
    mkvtoolnix
  ];
}
