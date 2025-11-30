{ mkShell, pkgs }:

mkShell {
  shellHook = ''
    export DATABASE_URL=postgresql://lafourmiliere@localhost/lafourmiliere
    export PUPPETEER_EXECUTABLE_PATH=${pkgs.ungoogled-chromium}/bin/chromium
    export PUPPETEER_SKIP_DOWNLOAD=true
  '';

  hardeningDisable = [ "format" ];

  packages = with pkgs; [
    bun
    corepack_latest
    curl
    lefthook
    # required to build psych ruby dependency
    libyaml
    nodejs_22
    npm-check-updates
    overmind
    pre-commit
    postgresql_16
    python311
    ruby_3_4
    ungoogled-chromium
    tmux
    yarn
  ];
}
