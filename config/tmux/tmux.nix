{ config, pkgs, ... }:
{
  programs.tmux = {
    sensibleOnTop = false;
    enable = true;
    clock24 = true;
    keyMode = "vi";
    newSession = true;
    prefix = "C-s";
    terminal = "alacritty";
    shell = "${pkgs.fish}/bin/fish";

    extraConfig = ''
      ${builtins.readFile ./tmux.conf}
    '';
  };
}
