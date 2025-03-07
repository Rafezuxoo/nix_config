# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #./amnezia.nix
      #./drivers/nvidia.nix
      ./drivers/nvidia_from_the_totoro.nix
      ./gnome.nix
      ./packages.nix
    ];
  
  # Bootloader.
  #systemd.user.services.keepassxc.unit.after = 0;
  #boot.loader.systemd-boot.enable = true;
  boot.loader = {
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 0;
    efi.canTouchEfiVariables = true;
  };
  #boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_6_12;
  #boot.kernelParams = [ "ipv6.disable=1" ];
  #boot.extraModulePackages = with config.boot.kernelPackages; [ wireguard ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ amneziawg ];
  boot.blacklistedKernelModules = [ "hid_magicmouse" ];


  networking.hostName = "nixos-home"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = false;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # multi-touch gesture recognizer

  services.libinput.enable = true;
  services.touchegg.enable = true;

  services.kanata = {
	enable = true;
	keyboards = {
	    default.config = builtins.readFile "${./kanata.kbd}";
        default.devices = [ ];
    };
  };

  services.zerotierone = {
      enable = true;
      joinNetworks = [
          "0cccb752f7e68ec7"
      ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.raf = {
    isNormalUser = true;
    description = "raf";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
  	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 14d";
   };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
#  let
#	unstable = import <nixos-unstable> { config = {allowUnfree = true; }; };
#  in {	
  
  nixpkgs.config.permittedInsecurePackages = [
     "qbittorrent-4.6.4"
  ];

  environment.variables.EDITOR = "nvim";

#  }

  programs = {
  	steam.enable = true;
	steam.gamescopeSession.enable = true;
	gamemode.enable = true;
	fish.enable = true;
    hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
    };
  };

  #programs.nixvim = {
  #  enable = true;

    #colorschemes.catppuccin.enable = true;
    #plugins.lualine.enable = true;cgcg



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
  system.stateVersion = "24.05"; # Did you read the comment?

}
