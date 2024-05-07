{ config, ...}:
{
    programs.rofi = {
        enable = true;
        theme = ./config.rasi;    
    };
}
