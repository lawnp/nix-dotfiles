{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Lan Pavletič";
    userEmail = "pavletic.lan@gmail.com";

    signing = {
      key = "703DAA0913F1DCBF ";
      signByDefault = true;
    };

    extraConfig = {
      gpg = {
        program = "${pkgs.gnupg}/bin/gpg";
      };
    };
  };
}
