{ config, ...}:
{
    programs.rofi = {
        enable = true;
        theme = let inherit (config.lib.formats.rasi) mkLiteral;
        in {
        };
    };
}
