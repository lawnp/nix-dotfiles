{ config, pkgs, ... }:
{
  programs.alacritty.enable = true;

  programs.alacritty.settings = {
    terminal.shell = "fish";

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
      size = 10;

      normal = {
        family = "Monaspace Neon";
        style = "Regular";
      };

      bold = {
        family = "Monaspace Neon";
        style = "Bold";
      };

      italic = {
        family = "Monaspace Radon";
        style = "Italic";
      };
    };

    # Tokyo Night Storm color scheme
    colors = {
      primary = {
        background = "#24283b";
        foreground = "#a9b1d6";
      };

      normal = {
        black = "#32344a";
        red = "#f7768e";
        green = "#9ece6a";
        yellow = "#e0af68";
        blue = "#7aa2f7";
        magenta = "#ad8ee6";
        cyan = "#449dab";
        white = "#9699a8";
      };

      bright = {
        black = "#444b6a";
        red = "#ff7a93";
        green = "#b9f27c";
        yellow = "#ff9e64";
        blue = "#7da6ff";
        magenta = "#bb9af7";
        cyan = "#0db9d7";
        white = "#acb0d0";
      };
    };

    general.live_config_reload = true;

    debug = {
      render_timer = false;
      persistent_logging = false;
      log_level = "Warn";
      print_events = false;
    };
  };
}
