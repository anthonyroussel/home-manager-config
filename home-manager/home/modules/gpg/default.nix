{
  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        source = ./pubkeys/9DC4987B1A55E75E.asc;
        trust = "ultimate";
      }
      {
        source = ./pubkeys/379FF498F4BDCCD9.asc;
        trust = "ultimate";
      }
    ];
  };
}
