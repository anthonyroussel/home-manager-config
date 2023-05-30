{ lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    extensions = (with pkgs.vscode-extensions; [
      bbenoist.nix
      bierner.markdown-mermaid
      bungcip.better-toml
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      github.codespaces
      github.vscode-pull-request-github
      hashicorp.terraform
      ms-vsliveshare.vsliveshare
      octref.vetur
      redhat.vscode-yaml
      wingrunr21.vscode-ruby
      yzhang.markdown-all-in-one
    ])
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
      "ruby.rubocop.useBundler" = true;
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[json]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      "[jsonc]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      "[markdown]" = {
        "editor.defaultFormatter" = "yzhang.markdown-all-in-one";
      };
      "[ruby]" = {
        "editor.defaultFormatter" = "rebornix.ruby";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[vue]" = {
        "editor.defaultFormatter" = "octref.vetur";
      };
      "[yaml]" = {
        "editor.defaultFormatter" = "redhat.vscode-yaml";
      };
      "window.zoomLevel" = 0;
      "diffEditor.renderSideBySide" = false;
    };
  };
}
