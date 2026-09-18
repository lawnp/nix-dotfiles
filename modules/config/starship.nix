{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      add_newline = true;

      git_branch = {
        symbol = " ";
      };
    };
  };
}
