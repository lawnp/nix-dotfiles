{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      use-package
      lsp-mode
      lsp-ui
      direnv
      which-key
      project
      magit
      markdown-mode
      yasnippet
      orderless
      consult
      ranger
      dashboard
      catppuccin-theme
      doom-modeline
      nerd-icons
    ];

  };

  home.file.".emacs.d" = {
    source = ./emacs;
    recursive = true;
  };
}
