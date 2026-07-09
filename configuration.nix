{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "hyprnix"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.getty.autologinUser ="mani";
  users.users."mani" = {
    isNormalUser = true;
    description = "mani";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable packages
  programs.hyprland.enable = true;
  programs.localsend.enable = true;
  hardware.bluetooth.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     wget
     btop
     kitty
     impala
     neovim
     unzip
     fastfetch
     bluetui
     wiremix
     ghostty
     librewolf
     waybar
     waywall
     prismlauncher
     nitch
     hyprlock
     hyprsunset
     hypridle
     swaybg
     git
     clang
     walker
     elephant
     zoxide
     wireplumber
     brightnessctl
     playerctl
     grim
     slurp
     wl-clipboard
     mako
     hyprpicker
     jq
     uwsm
     gnome-calculator
     signal-desktop
     nautilus
     tmux
  ];

  environment.variables = {
      EDITOR = "nvim";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
