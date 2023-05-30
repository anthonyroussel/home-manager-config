{
  programs.brave = {
    enable = true;
    extensions = [
      { id = "cfhdojbkjhnklbpkdaibdccddilifddb"; } # adblock
    ];
  };

  programs.google-chrome = {
    enable = true;
  };
}
