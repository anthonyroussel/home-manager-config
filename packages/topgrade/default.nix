{
  programs.topgrade = {
    enable = true;
    settings = {
      disable = [
        "node"
        "oh-my-zsh"
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
