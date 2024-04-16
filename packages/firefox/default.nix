{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [ pkgs.fx-cast-bridge ];
    profiles = {
      default = {
        name = "default";
        settings = {
          # See https://github.com/nixypanda/dotfiles/blob/master/modules/firefox/config/annoyances.nix
          # Disable the first run tabs with advertisements for the latest firefox features.
          "browser.startup.homepage_override.mstone" = "ignore";

          # Disable new tab page intro
          "browser.newtabpage.introShown" = false;

          # Disable Sponsored Top Sites
          "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite" = false;

          # Do not trim URLs in navigation bar
          "browser.urlbar.trimURLs" = false;

          # Disable checking if Firefox is the default browser
          "browser.shell.checkDefaultBrowser" = false;

          # Enable Do-not-Track
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;

          # Use KDE File picker using XDG Desktop portal
          "widget.use-xdg-desktop-portal.file-picker" = 1;
        };
      };
    };
  };
}
