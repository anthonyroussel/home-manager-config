{
  programs.brave = {
    enable = true;
    extensions = [
      { id = "gighmmpiobklfepjocnamgkkbiglidom"; } # AdBlock — best ad blocker
      { id = "jpmkfafbacpgapdghgdpembnojdlgkdl"; } # AWS Extend Switch Roles
      { id = "fdjamakpfbbddfjaooikfcpapjohcfmg"; } # Dashlane
    ];
  };

  programs.google-chrome = {
    enable = true;
  };
}
