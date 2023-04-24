{
  programs.topgrade = {
    enable = true;
    settings = {
      disable = [
        "node"
      ];
      set_title = false;
      skip_notify = true;
      cleanup = true;
      commands = {
        "Run garbage collection on Nix store" = "nix-collect-garbage";
      };
      git = {
        repos = [
          "~/src/*/"
        ];
      };
    };
  };
}
