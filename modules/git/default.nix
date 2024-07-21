{ config, lib, pkgs, ... }:

let
  cfg = config.rsl.hm-git;

in {
  options.rsl.hm-git = {
    enable = lib.mkEnableOption "custom git";

    userName = lib.mkOption {
      type = lib.types.str;
      description = "Default user name to use.";
    };

    userEmail = lib.mkOption {
      type = lib.types.str;
      description = "Default user email to use.";
    };

    signingKey = lib.mkOption {
      type = lib.types.str;
      description = "Default signing key to use.";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      package = pkgs.gitFull;

      userEmail = cfg.userEmail;
      userName = cfg.userName;
      signing = {
        key = cfg.signingKey;
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
        merge = {
          conflictStyle = "zdiff3";
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
      settings = {
        aliases = {
          co = "pr checkout";
          pv = "pr view";
        };
      };
    };

    home.file.".config/gh/hosts.yml".text = ''
      github.com:
        user: anthonyroussel
        git_protocol: https
        users:
          anthonyroussel: {}
    '';

    home.packages = (
      with pkgs;
      [
        # https://github.com/tj/git-extras
        git-extras
        gitflow
      ]
    );
  };
}
