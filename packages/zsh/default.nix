{ pkgs, ... }:

let
  sessionVariables = {
    # Suppress direnv verbose logging
    DIRENV_LOG_FORMAT = "";

    # Suppress AWS profile info on right side of screen
    SHOW_AWS_PROMPT = "false";
  };

  shellAliases = {
    "ll" = "ls -alF";
    "la" = "ls -A";
    "ls" = "ls --color=auto";
    "grep" = "rg";
  };
in
{
  programs.dircolors = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.htop = {
    enable = true;
  };

  programs.less = {
    enable = true;
  };

  programs.nix-index = {
    enable = true;
  };

  # programs.nix-index = {
  #   enable = true;
  # };

  programs.ripgrep = {
    enable = true;
  };

  programs.translate-shell = {
    enable = true;
    settings = {
      hl = "fr";
      tl = "en";
    };
  };

  programs.yt-dlp = {
    enable = true;
  };

  programs.bash = {
    inherit sessionVariables shellAliases;
    enable = true;
    initExtra = ''
      source ${pkgs.nixpkgs-review-checks}/etc/profile.d/nixpkgs-review-checks-hook
    '';
    historyIgnore = [
      "ls"
      "cd"
      "exit"
    ];
  };

  programs.zsh = {
    inherit sessionVariables shellAliases;
    enable = true;
    history = {
      ignorePatterns = [
        "*prod*"
        "ls *"
        "cd *"
        "exit"
      ];
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "aws"
        "bundler"
        "common-aliases"
        "direnv"
        "emoji"
        "genpass"
        "git"
        "git-prompt"
        "kubectl"
        "node"
        "npm"
        "rails"
        "systemd"
        "tmux"
        "vscode"
        "yarn"
      ];
    };
  };
}
