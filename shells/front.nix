{ mkShell, pkgs }:

mkShell {
  shellHook = ''
    export PUPPETEER_EXECUTABLE_PATH=${pkgs.ungoogled-chromium}/bin/chromium
    export PUPPETEER_SKIP_DOWNLOAD=true
  '';

  hardeningDisable = [ "format" ];

  packages = with pkgs; [
    lefthook
    nodejs_24
    npm-check-updates
    pnpm
    ungoogled-chromium
  ];
}
