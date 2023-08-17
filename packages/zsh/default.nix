{ pkgs, ... }:

{
  programs.dircolors = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      source ${pkgs.nixpkgs-review-checks}/etc/profile.d/nixpkgs-review-checks-hook
    '';
    shellAliases = {
      "ll" = "ls -alF";
      "la" = "ls -A";
      "ls" = "ls --color=auto";
      "grep" = "grep --color=auto";
    };
  };

  programs.zsh = {
    enable = true;
    history = {
      ignorePatterns = [
        "prod"
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
        "ruby"
        "systemd"
        "tmux"
        "vscode"
        "yarn"
      ];
    };
    sessionVariables = {
      # Suppress direnv verbose logging
      DIRENV_LOG_FORMAT = "";

      # Suppress AWS profile info on right side of screen
      SHOW_AWS_PROMPT = "false";
    };
  };
}
