{ pkgs, ... }:

{
  programs.borgmatic = {
    enable = true;
    backups = {
      personal = {
        location = {
          repositories = [ "/run/media/aroussel/leezy/backups/borg" ];
          patterns = [
            "R /etc/nixos"
            "R /home/aroussel"
            "- /home/aroussel/.ansible"
            "- /home/aroussel/.asdf"
            "- /home/aroussel/.aws/sso"
            "- /home/aroussel/.bundle"
            "- /home/aroussel/.cache"
            "- /home/aroussel/.config/BraveSoftware"
            "- /home/aroussel/.config/chromium"
            "- /home/aroussel/.config/Code"
            "- /home/aroussel/.gem"
            "- /home/aroussel/.helm"
            "- /home/aroussel/.local/share/gem"
            "- /home/aroussel/.local/share/pnpm"
            "- /home/aroussel/.local/share/virtualenvs"
            "- /home/aroussel/.m2"
            "- /home/aroussel/.npm"
            "- /home/aroussel/.vscode"
            "- /home/aroussel/.wine"
            "- /home/aroussel/go"
            "- /home/aroussel/src/nixpkgs"
          ];
          extraConfig = {
            exclude_caches = true;
            exclude_patterns = [ "*node_modules*" ];
            one_file_system = true;
          };
        };
      };
    };
  };

  home.packages = with pkgs; [ borgbackup ];
}
