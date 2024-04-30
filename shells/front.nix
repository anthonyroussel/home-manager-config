{ mkShell, pkgs }:

mkShell {
  shellHook = ''
    export PUPPETEER_EXECUTABLE_PATH=${pkgs.ungoogled-chromium}/bin/chromium
    export PUPPETEER_SKIP_DOWNLOAD=true
  '';

  hardeningDisable = [ "format" ];

  packages = with pkgs; [
    corepack_latest
    lefthook
    nodejs_20
    npm-check-updates
    ungoogled-chromium
  ];
}
