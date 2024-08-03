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

    extraConfig = ''
      ${builtins.readFile ./tmux.conf}
    '';
  };
}
