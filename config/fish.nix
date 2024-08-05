{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      v = "nvim";
    };
  };
}
