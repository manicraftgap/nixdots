{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./pkgs.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "hyprnix";
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

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.logind.settings = {
    Login = {
      HandlePowerKey = "ignore";
    };
  };

  services.getty.autologinUser ="mani";
  users.users."mani" = {
    isNormalUser = true;
    description = "mani";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  nixpkgs.config.allowUnfree = true;
  programs.hyprland.enable = true;
  programs.localsend.enable = true;
  services.power-profiles-daemon.enable = true;
  services.ratbagd.enable = true;
  hardware.bluetooth.enable = true;
  environment.variables = {
      EDITOR = "nvim";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05"; # Did you read the comment?
}
