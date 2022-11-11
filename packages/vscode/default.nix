{ lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    extensions = (with pkgs.vscode-extensions; [
      octref.vetur
      dbaeumer.vscode-eslint
      yzhang.markdown-all-in-one
      bungcip.better-toml
      github.codespaces
      github.vscode-pull-request-github
      bbenoist.nix
      esbenp.prettier-vscode
    ])
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
      name = "vscode-ruby";
      publisher = "wingrunr21";
      version = "0.28.0";
      sha256 = "sha256-H3f1+c31x+lgCzhgTb0uLg9Bdn3pZyJGPPwfpCYrS70=";
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
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[json]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      "[jsonc]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      "[ruby]" = {
        "editor.defaultFormatter" = "rebornix.ruby";
      };
      "[vue]" = {
        "editor.defaultFormatter" = "octref.vetur";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "window.zoomLevel" = 0;
      "diffEditor.renderSideBySide" = false;
    };
  };
}
