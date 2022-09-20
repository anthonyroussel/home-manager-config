{
  permittedInsecurePackages = [
    "nodejs-12.22.12"
  ];
  allowUnfree = true;
  # allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  #   "google-chrome"
  #   "slack"
  #   "android-studio-stable"
  #   "vscode"
  #   "spotify"
  #   "spotify-unwrapped"
  #   "microsoft-edge-stable"
  # ];
}
