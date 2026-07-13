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

  };
in
{
  home.username = "mani";
  home.homeDirectory = "/home/mani";
  home.stateVersion = "26.11";
  programs.eza.enable = true;
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "eza --long --header --icons=auto";
      btw = "echo i use hyprland btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#hyprnix";
      vim = "nvim";
    };
    initExtra = ''
    if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    fi
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
      nitch
    gcm() {
      cd ~/nixos-dotfiles || exit 1
      git fetch origin
      git reset --hard origin/main
      cd ~/
      nrs
      hyprctl reload
    }
    '';
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
          exec start-hyprland
      fi
    '';
  };

  programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
      options = [ "--cmd cd" ];
    };

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  programs.starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        format = "$directory$character";
        directory = {
          style = "white";
          truncation_length = 3;
          truncate_to_repo = false;
        };
        character = {
          success_symbol = "[❯](white)";
          error_symbol = "[❯](white)";   
        };
      };
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
