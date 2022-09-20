{ lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    extensions = (with pkgs.vscode-extensions; [
      octref.vetur
      dbaeumer.vscode-eslint
      yzhang.markdown-all-in-one
      bungcip.better-toml
      github.vscode-pull-request-github
      bbenoist.nix
    ])
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
      name = "vscode-ruby";
      publisher = "wingrunr21";
      version = "0.28.0";
      sha256 = "1f77f5f9cdf5c7e9600b38604dbd2e2e0f41767de96722463cfc1fa4262b4bbd";
    }]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
      name = "ruby-rubocop";
      publisher = "misogi";
      version = "0.8.6";
      sha256 = "ea1809cce7ab1820977290039c849aedec109d158b027ea4e8ae242c9474f542";
    }];

    userSettings = {
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "ruby.format" = "rubocop";
      "ruby.intellisense" = "rubyLocate";
      "ruby.useLanguageServer" = true;
      "ruby.useBundler" = true;
      "[ruby]" = {
        "editor.defaultFormatter" = "rebornix.ruby";
      };
      "[vue]" = {
        "editor.defaultFormatter" = "octref.vetur";
      };
      "window.zoomLevel" = 2;
    };
  };
}
