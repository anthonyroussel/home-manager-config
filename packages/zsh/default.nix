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
        "git"
        "ruby"
        "yarn"
        "node"
        "direnv"
        "rails"
        "vscode"
        "aws"
        "kubectl"
        "bundler"
        "genpass"
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
