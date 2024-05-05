{pkgs, ...}: {
  home.packages = with pkgs; [
    rofi
  ];

  xdg = {
    configFile = {
      "rofi/colors.rasi".text = ''
        ${builtins.readFile .square.rasi}
      '';
    };
  };
}
