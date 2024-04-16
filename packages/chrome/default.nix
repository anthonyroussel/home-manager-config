{ pkgs, nixpkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # proton pass
    ];
    dictionaries = with pkgs.hunspellDictsChromium; [
      en_GB
      fr_FR
    ];
  };
}
