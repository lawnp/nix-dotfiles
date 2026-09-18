{ pkgs, ... }:
{
  imports = [
    ./gnu.nix
    ./ocaml.nix
    ./nix.nix
  ];

  environment.systemPackages = with pkgs; [
    ripgrep
    fzf
  ];
}
