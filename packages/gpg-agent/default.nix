{
  services.gpg-agent = {
    enable = true;

    # Set the maximum time a cache entry is valid.
    maxCacheTtl = 900;

    # Set the maximum time a cache entry used for SSH keys is valid.
    maxCacheTtlSsh = 900;

    # Use pinentry-gnome3 as the PIN entry.
    pinentryFlavor = "gnome3";

    enableSshSupport = true;
  };
}
