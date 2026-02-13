{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    go
    gopls
    gotools
  ];
}
