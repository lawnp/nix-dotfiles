{
  config,
  pkgs,
  lib,
  flake-inputs,
  ...
}:
let
  sway-conf = pkgs.writeText "sway-regreet-config" ''
    exec "${config.programs.regreet.package}/bin/regreet; ${config.programs.sway.package}/bin/swaymsg exit"
    include /home/lan/.config/sway/config
  '';
in
{
  services.greetd.settings.default_session = {
    command = "${config.programs.sway.package}/bin/sway --config ${sway-conf}";
  };
}
