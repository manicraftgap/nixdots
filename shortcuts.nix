{ pkgs, ... }: {
  xdg.desktopEntries = {

    draftout = {
      name = "Draftout";
      comment = "Launch Draftout instance in Prism Launcher";
      icon = "/home/mani/.local/share/PrismLauncher/instances/Draftout/minecraft/icon.png";
      exec = "/home/mani/Applications/PrismLauncher-Linux-x86_64.AppImage --launch \"Draftout\"";
      categories = [ "Game" ];
      settings = {
        Path = "/home/mani/.local/share/PrismLauncher/instances/Draftout/minecraft/icon.png";
        Keywords = "Minecraft;Prism;Launcher;";
      };
    };

    github = {
      name = "GitHub";
      comment = "GitHub";
      icon = "/home/mani/.local/share/applications/icons/GitHub.png";
      exec = "uwsm-app -- xdg-open \"https://github.com/\"";
      terminal = false;
      settings = {
        StartupNotify = "true";
      };
    };

    mcsr-ranked = {
      name = "MCSR Ranked";
      comment = "Launch MCSR instance in Prism Launcher";
      icon = "/home/mani/.local/share/PrismLauncher/instances/MCSRRanked/minecraft/icon.png";
      exec = "/home/mani/Applications/PrismLauncher-Linux-x86_64.AppImage --launch \"MCSRRanked\"";
      categories = [ "Game" ];
      settings = {
        Path = "/home/mani/.local/share/PrismLauncher/instances/MCSRRanked";
        Keywords = "Minecraft;Prism;Launcher;";
      };
    };

    monkeytype = {
      name = "Monkeytype";
      comment = "Monkeytype";
      icon = "/home/mani/.local/share/applications/icons/Monkeytype.png";
      exec = "uwsm-app -- xdg-open \"https://monkeytype.com/\"";
      terminal = false;
      settings = {
        StartupNotify = "true";
      };
    };

    pvp-plus = {
      name = "PVP+";
      comment = "Launch PVP+ instance in Prism Launcher";
      icon = "/home/mani/.local/share/PrismLauncher/instances/PVP+/minecraft/icon.png";
      exec = "/home/mani/Applications/PrismLauncher-Linux-x86_64.AppImage --launch \"PVP+\"";
      categories = [ "Game" ];
      settings = {
        Path = "/home/mani/.local/share/PrismLauncher/instances/PVP+";
        Keywords = "Minecraft;Prism;Launcher;";
      };
    };

    youtube = {
      name = "YouTube";
      comment = "YouTube";
      icon = "/home/mani/.local/share/applications/icons/YouTube.png";
      exec = "uwsm-app -- xdg-open \"https://youtube.com/\"";
      terminal = false;
      settings = {
        StartupNotify = "true";
      };
    };

  };
}
