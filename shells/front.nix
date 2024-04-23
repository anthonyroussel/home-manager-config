{ mkShell, pkgs }:

mkShell {
  shellHook = ''
    export PUPPETEER_EXECUTABLE_PATH=${pkgs.ungoogled-chromium}/bin/chromium
    export PUPPETEER_SKIP_DOWNLOAD=true
  '';

  hardeningDisable = [ "format" ];

  nativeBuildInputs = with pkgs; [
    corepack_latest
    lefthook
    nodejs_21
    npm-check-updates
    ungoogled-chromium
  ];
}
