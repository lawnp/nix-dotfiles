# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager

    ./greeter
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      lan = import ./home.nix;
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Ljubljana";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sl_SI.UTF-8";
    LC_IDENTIFICATION = "sl_SI.UTF-8";
    LC_MEASUREMENT = "sl_SI.UTF-8";
    LC_MONETARY = "sl_SI.UTF-8";
    LC_NAME = "sl_SI.UTF-8";
    LC_NUMERIC = "sl_SI.UTF-8";
    LC_PAPER = "sl_SI.UTF-8";
    LC_TELEPHONE = "sl_SI.UTF-8";
    LC_TIME = "sl_SI.UTF-8";
  };

  security.polkit.enable = true;
  security.pam.services.hyprlock = { };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "si";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "slovene";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lan = {
    isNormalUser = true;
    description = "Lan Pavletič";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "docker"
    ];
    packages = with pkgs; [ ];
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "lan" ];


  # start sway at startup
  # environment.loginShellInit = ''
  #   [[ "$(tty)" == /dev/tty1 ]] && sway
  # '';

  environment = {
    variables = {
      GSK_RENDERER = "ngl";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # fonts
  fonts.packages = with pkgs; [
    font-awesome
    monaspace
  ];

  # Audio stuff
  hardware.pulseaudio.enable = false;
  hardware.pulseaudio.support32Bit = false;
  nixpkgs.config.pulseaudio = true;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bluetooth stuff
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true; # for bluetoothctl
  services.flatpak.enable = true;
  services.pcscd.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = with pkgs; pinentry-curses;
  };

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
      host  all      all     127.0.0.1/32   trust
    '';

    settings = {
        log_connections = true;
        log_statement = "all";
        logging_collector = true;
        log_disconnections = true;
        log_directory = "pg_log";
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    alacritty
    firefox
    wdisplays
    waybar
    unzip
    swaybg
    ncpamixer
    nil
    nixfmt-rfc-style
    spotify
    discord
    hyprlock
    greetd.regreet
    direnv
    nix-direnv
    slack
    dbeaver-bin
    postman
    ranger
    mqttx
    obsidian
    checkstyle

    # this is for go pprof
    graphviz
  ];


  # Docker
  virtualisation.docker = {
    enable = true;
    daemon.settings.live-restore = false;
  };

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish; # zsh default for all users

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.sway.default = pkgs.lib.mkForce ["wlr"];
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.kdePackages.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = [ "wlr" ];
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = false;
    desktopManager.gnome.enable = true;
  };

  services = {
    displayManager = {
      sessionPackages = [ pkgs.sway ];
    };
  };

  networking.firewall.enable = false;

  # sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
