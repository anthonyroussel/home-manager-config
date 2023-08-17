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

  services.gpg-agent = {
    enable = true;

    # Set the maximum time a cache entry is valid.
    maxCacheTtl = 3600;

    # Set the maximum time a cache entry used for SSH keys is valid.
    maxCacheTtlSsh = 3600;

    # Use pinentry-gnome3 as the PIN entry.
    pinentryFlavor = "gnome3";

    enableSshSupport = true;
  };
}
