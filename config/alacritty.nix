{ config, pkgs, ... }:
{
  programs.alacritty.enable = true;

  programs.alacritty.settings = {
    shell = "fish";

    env = {
      TERM = "xterm-256color";
    };

    window = {
      padding = {
        x = 20;
        y = 20;
      };
    };

    scrolling = {
      history = 10000;
      multiplier = 3;
    };

    font = {
      size = 11;

      normal = {
        family = "B612 Mono";
        style = "Regular";
      };

      bold = {
        family = "B612 Mono";
        style = "Bold";
      };

      italic = {
        family = "B612 Mono";
        style = "Italic";
      };
    };

    colors = {
      primary = {
        background = "#232136";
        foreground = "#e0def4";
        dim_foreground = "#cdcbe0";
        bright_foreground = "#eae8ff";
      };

      cursor = {
        text = "#e0def4";
        cursor = "#cdcbe0";
      };

      vi_mode_cursor = {
        text = "#e0def4";
        cursor = "#9ccfd8";
      };

      search = {
        matches = {
          foreground = "#e0def4";
          background = "#63577d";
        };

        focused_match = {
          foreground = "#e0def4";
          background = "#a3be8c";
        };
      };

      footer_bar = {
        foreground = "#e0def4";
        background = "#373354";
      };

      hints = {
        start = {
          foreground = "#e0def4";
          background = "#ea9a97";
        };

        end = {
          foreground = "#e0def4";
          background = "#373354";
        };
      };

      selection = {
        text = "#e0def4";
        background = "#433c59";
      };

      normal = {
        black = "#393552";
        red = "#eb6f92";
        green = "#a3be8c";
        yellow = "#f6c177";
        blue = "#569fba";
        magenta = "#c4a7e7";
        cyan = "#9ccfd8";
        white = "#e0def4";
      };

      bright = {
        black = "#47407d";
        red = "#f083a2";
        green = "#b1d196";
        yellow = "#f9cb8c";
        blue = "#65b1cd";
        magenta = "#ccb1ed";
        cyan = "#a6dae3";
        white = "#e2e0f7";
      };

      dim = {
        black = "#322e42";
        red = "#d84f76";
        green = "#8aa872";
        yellow = "#e6a852";
        blue = "#4a869c";
        magenta = "#a580d2";
        cyan = "#7bb8c1";
        white = "#b1acde";
      };

      indexed_colors = [
        {
          index = 16;
          color = "#ea9a97";
        }
        {
          index = 17;
          color = "#eb98c3";
        }
      ];
    };

    live_config_reload = true;

    debug = {
      render_timer = false;
      persistent_logging = false;
      log_level = "Warn";
      print_events = false;
    };
  };
}
