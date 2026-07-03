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
  };
in
{

  home.username = "mani";
  home.homeDirectory = "/home/mani";
  home.stateVersion = "26.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use hyprland btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#hyprnix";
      vim = "nvim";
    };
    initExtra = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
      nitch
    gcm() {
      rm -rf ~/nixos-dotfiles
      git clone https://github.com/manicraftgap/nixos-dotfiles ~/nixos-dotfiles
    }
    '';
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
          exec start-hyprland
      fi
    '';
  };

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  home.packages = with pkgs; [
    yazi
    pkgs.writeShellApplication 
    {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    }
  ];
}
