{
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [
      pkgs.fx-cast-bridge
    ];
    profiles = {
      default = {
        name = "default";
        settings = [

        ];
      };
    };
  };
}
