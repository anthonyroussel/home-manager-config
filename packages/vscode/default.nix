{
  inputs,
  lib,
  pkgs,
  ...
}:

let
  extensions = with inputs.nix-vscode-extensions.extensions."${pkgs.system}".vscode-marketplace; [
    bbenoist.nix
    bierner.markdown-mermaid
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode
    github.vscode-pull-request-github
    golang.go
    hashicorp.terraform
    jnoortheen.nix-ide
    ms-vscode-remote.remote-containers
    ms-vsliveshare.vsliveshare
    octref.vetur
    redhat.vscode-yaml
    tamasfe.even-better-toml
    yzhang.markdown-all-in-one
  ];
in

{
  programs.vscode = {
    enable = true;
    profiles.default = {
      inherit extensions;
      userSettings = {
        "[javascript]" = {
          "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
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
        "[typescript]" = {
          "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
        };
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
        };
        "[vue]" = {
          "editor.defaultFormatter" = "octref.vetur";
        };
        "[yaml]" = {
          "editor.defaultFormatter" = "redhat.vscode-yaml";
        };
        "diffEditor.renderSideBySide" = false;
        "editor.insertSpaces" = true;
        "editor.tabSize" = 2;
        "editor.wordWrap" = "on";
        "files.eol" = "\n";
        "files.insertFinalNewline" = true;
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "nix.enableLanguageServer" = true;
        "nix.formatterPath" = lib.getExe pkgs.nixfmt;
        "nix.serverPath" = lib.getExe pkgs.nixd;
        "telemetry.telemetryLevel" = "off";
        "update.mode" = "none";
        "window.zoomLevel" = 0;
      };
    };
  };
}
