{ pkgs, ... }:

{
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
