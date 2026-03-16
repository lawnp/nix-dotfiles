{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Lan Pavletič";
    userEmail = "pavletic.lan@gmail.com";

    signing = {
      key = "886A4E3561CF04A6";
      signByDefault = true;
    };

    extraConfig = {
      gpg = {
        program = "${pkgs.gnupg}/bin/gpg";
      };
    };
  };
}
