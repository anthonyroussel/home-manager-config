{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userEmail = "anthony@roussel.dev";
    userName = "Anthony Roussel";
    signing = {
      key = "D95720261A76CB57C60669F6D8368CAC92C19577";
      signByDefault = true;
    };

    aliases = {
      br = "branch";
      ci = "commit";
      co = "checkout";
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      pu = "pull";
      sh = "show";
      st = "status -sb";
    };

    extraConfig = {
      core = {
        excludesfile = "${config.home.homeDirectory}/.gitignore";
      };
      credential = {
        helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = false;
      };
    };

    lfs = {
      enable = true;
    };
  };

  programs.gh = {
    enable = true;
    enableGitCredentialHelper = true;
  };

  home.packages = (with pkgs; [
    # https://github.com/tj/git-extras
    git-extras
    gitflow
  ]);
}
