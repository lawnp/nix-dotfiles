{ config, pkgs, ... }:
let
  myEmacs =
    (pkgs.emacsPackagesFor pkgs.emacs).emacsWithPackages (epkgs: with epkgs; [
      vterm
      treesit-grammars.with-all-grammars
    ]);
in
{
  programs.emacs = {
    enable = true;
    package = myEmacs;
    extraPackages = epkgs: with epkgs; [
      use-package
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
      magit
      nix-ts-mode
      go-mode
      consult
      dune
      tuareg
      ocaml-eglot
    ];

  };

  services.emacs = {
    enable = true;
    client.enable = true;
  };

  home.file.".emacs.d" = {
    source = ./emacs;
    recursive = true;
  };
}
