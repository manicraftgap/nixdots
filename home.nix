{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    nvim = "nvim";
    waybar = "waybar";
    walker = "walker";
    elephant = "elephant";
    ghostty = "ghostty";
    NBTrackr = "NBTrackr";
    waywall = "waywall";
    millennium = "millennium";
    hypr = "hypr";
    btop = "btop";
    mako = "mako";
    swaybg = "swaybg";
    swayosd = "swayosd";
    yazi = "yazi";
    startship = "starship.toml";
  };
in
{
  imports = [
    ./shell.nix
    ./utilities.nix
  ];
  home.username = "mani";
  home.homeDirectory = "/home/mani";
  home.stateVersion = "26.11";
  programs.eza.enable = true;
  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    
    package = pkgs.quintom-cursor-theme;
    name = "Quintom_Ink";
    size = 24;
  };

  home.packages = with pkgs; [
    yazi
    (pkgs.writeShellApplication 
    {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];
}
