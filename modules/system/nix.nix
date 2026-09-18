{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nil
    nixfmt-rfc-style
    direnv
    nix-direnv
  ];
}
