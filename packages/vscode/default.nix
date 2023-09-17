{ lib, pkgs, ... }:

let
  extensions = with pkgs.vscode-marketplace; [
    bbenoist.nix
    bierner.markdown-mermaid
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode
    github.codespaces
    github.vscode-pull-request-github
    golang.go
    hashicorp.terraform
    ms-vscode-remote.remote-containers
    ms-vsliveshare.vsliveshare
    octref.vetur
    redhat.vscode-yaml
    tamasfe.even-better-toml
    wingrunr21.vscode-ruby
    yzhang.markdown-all-in-one
  ];

in
{
  programs.vscode = {
    inherit extensions;

    enable = true;
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
