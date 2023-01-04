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
      DIRENV_LOG_FORMAT = "";
    };
  };
}
