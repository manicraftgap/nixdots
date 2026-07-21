{ config, pkgs, ... }:

{
  services.flatpak.enable = true;
  services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub";
    location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
  }];
  services.flatpak.packages = [
    "org.vinegarhq.Sober"
  ];
};

{
  environment.systemPackages = with pkgs; [
    wget
    btop
    kitty
    impala
    neovim
    tree-sitter
    unzip
    fastfetch
    bluetui
    wiremix
    ghostty
    librewolf
    waywall
    waybar
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
    satty
    wl-clipboard
    mako
    hyprpicker
    jq
    uwsm
    gnome-calculator
    signal-desktop
    nautilus
    tmux
    libnotify
    dragon-drop
    findutils
    power-profiles-daemon
    piper
    jq
    ripgrep
    fd
    lazygit
    lua-language-server
    imagemagick
    ghostscript
    tectonic
    mermaid-cli
    trash-cli
    sqlite
    vesktop
    mcpelauncher-ui-qt
    steam
    samrewritten
    bitwarden
    cliamp
    galaxy-buds-client
    gale
    kdePackages.kdenlive
    obs-studio
    pinta
    telegram-desktop
    libreoffice
    mullvad-vpn
    mpv

  ];
}
