{ pkgs, ... }:
{
  imports = [
    ./gnu.nix
    ./ocaml.nix
    ./nix.nix
    ./go.nix
  ];

  environment.systemPackages = with pkgs; [
    ripgrep
    fzf
  ];
}
