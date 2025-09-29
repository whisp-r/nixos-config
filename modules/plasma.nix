{ config, pkgs, ... }:

{
  # KDE Plasma related configuration (wayland)

  # KDE Plasma 6
  programs.xwayland.enable = true;
  services.desktopManager.plasma6 = {
    enable = true;
    enableQt5Integration = true;
  };

}
