{ config, pkgs, ... }:

{
  imports = [
    ./config/alacritty.nix
    ./config/neovim.nix
    ./config/zsh.nix
    ./config/fish.nix
    ./config/starship.nix
    ./config/waybar/waybar.nix
    ./config/git.nix
    ./config/rofi/rofi.nix
    ./config/tmux/tmux.nix
    ./config/hyprlock.nix
    ./config/wlogout.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lan";
  home.homeDirectory = "/home/lan";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [ bat ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
