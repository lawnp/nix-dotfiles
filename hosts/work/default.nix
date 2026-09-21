{ ... }:
{
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "work";

  home-manager.users.lan.programs.git.signing.key = "886A4E3561CF04A6";
}

