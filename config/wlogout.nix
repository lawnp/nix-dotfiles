{ config, pkgs, ... }:
{
  programs.wlogout = {
    enable = true;

    layout = [

      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }

      {
        label = "lock";
        action = "hyprlock --quite";
        text = "Lock";
        keybind = "l";
      }

      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }

      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
  };
}
