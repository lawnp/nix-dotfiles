{ config, pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;

        # this crashes hyprlock
        # grace = 300;

        hide_cursor = false;
        no_fade_in = false;
        no_fade_out = false;
        immediate_render = false;
        pam_module = "hyprlock";
        text_trim = true;
      };

      background = [
        {
          path = "/home/lan/.wallpapers/black.jpg";
          blur_passes = 1;
          blur_size = 3;
        }
      ];

      label = [
        {
          text = "$TIME";
          text_align = "center";
          font_size = 25;
          position = "0, 80";
          halign = "center";
          valign = "center";
          font_family = "Noto Sans";
          color = "rgb(224, 239, 244)";
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(224, 239, 244)";
          inner_color = "rgb(55, 51, 84)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "<span foreground=\"##cad3f5\">Password...</span>";
          shadow_passes = 2;
        }
      ];
    };
  };
}
