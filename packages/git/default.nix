{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userEmail = "anthony@roussel.dev";
    userName = "Anthony Roussel";
    signing = {
      key = "472D368AF107F443F3A5C7129DC4987B1A55E75E";
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
      init = {
        defaultBranch = "master";
      };
      pull = {
        rebase = false;
      };
      push = {
        autoSetupRemote = true;
      };
    };

    lfs = {
      enable = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  home.packages = (with pkgs; [
    # https://github.com/tj/git-extras
    git-extras
    gitflow
  ]);
}
