{ mkShell, pkgs }:

mkShell {
  shellHook = ''
    export DATABASE_URL=postgresql://lafourmiliere@localhost/lafourmiliere
    export PUPPETEER_EXECUTABLE_PATH=${pkgs.ungoogled-chromium}/bin/chromium
    export PUPPETEER_SKIP_DOWNLOAD=true
  '';

  hardeningDisable = [ "format" ];

  nativeBuildInputs = with pkgs; [
    bun
    corepack_21
    curl
    lefthook
    # required to build psych ruby dependency
    libyaml
    nodejs_18
    npm-check-updates
    overmind
    pre-commit
    python311
    ruby_3_3
    ungoogled-chromium
    tmux
    yarn
  ];
}
