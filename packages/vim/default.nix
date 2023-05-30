{ lib, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    plugins = with pkgs; [
      vimPlugins.LazyVim
    ];
    settings = {
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
    };
    extraConfig = ''
      set nocompatible
      filetype off

      " Redefine tab as 2 spaces by default
      filetype plugin indent on
      set softtabstop=2

      " Enable autoindent on new line
      set autoindent

      " Enable syntax highlighting
      syntax enable

      " Use shift-tab for unindent
      nnoremap <S-Tab> <<
      inoremap <S-Tab> <C-d>

      " Securise Vim editor with gopass (might leak credentials).
      " See https://github.com/gopasspw/gopass/blob/master/docs/setup.md#securing-your-editor
      au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
    '';
    defaultEditor = true;
  };
}
