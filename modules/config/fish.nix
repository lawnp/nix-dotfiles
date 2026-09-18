{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      v = "nvim";
      nix-shell = "nix-shell --run fish";
    };
  };
}
