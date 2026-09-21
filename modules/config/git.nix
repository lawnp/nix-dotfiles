{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Lan Pavletič";
    userEmail = "pavletic.lan@gmail.com";

    signing.signByDefault = true;

    extraConfig = {
      gpg = {
        program = "${pkgs.gnupg}/bin/gpg";
      };
    };
  };
}
