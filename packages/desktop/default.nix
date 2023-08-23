{ pkgs, config, ... }:
{
  dconf.settings = {
    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      clock-show-seconds = true;
      clock-show-weekday = true;
      enable-hot-corners = true;
      gtk-theme = "Adwaita-dark";
      show-battery-percentage = true;
      text-scaling-factor = 1.20;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gnome/desktop/sound" = {
      events-sound = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/desktop/wm/keybindings" = {
      # Change Alt-Tab shortcut to switch windows.
      switch-applications = [ "<Super>Tab" ];
      switch-applications-backward = [ "<Shift><Super>Tab" ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/aws-mfa" = {
      name = "aws-otp";
      binding = "<Control><Shift>a";
      command = "${pkgs.bash}/bin/bash -c \"${pkgs.oath-toolkit}/bin/oathtool --totp --base32 $(${pkgs.gopass}/bin/gopass -o corp/aws-mfa) | ${pkgs.xclip}/bin/xclip -selection clipboard\"";
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      logout = [ ];
      power = [ "<Control><Alt>Delete" ];
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/aws-mfa/"
      ];
    };
    "org/gnome/shell" = {
      disabled-extensions = [
        "ubuntu-appindicators@ubuntu.com"
        "ubuntu-dock@ubuntu.com"
      ];
    };
    "org/gnome/shell/extensions/openweather" = {
      city = "48.8588897,2.3200410217200766>Paris, Île-de-France, France métropolitaine, France >0";
    };
    "org/gnome/GWeather4" = {
      temperature-unit = "centigrade";
    };
  };
  fonts.fontconfig.enable = true;

  home.packages = with pkgs.gnomeExtensions; [
    applications-menu
    disconnect-wifi
    openweather
    places-status-indicator
    removable-drive-menu
    sound-output-device-chooser
    user-themes
    vitals
    workspace-indicator
  ];
}
