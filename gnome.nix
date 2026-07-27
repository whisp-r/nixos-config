{ pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;

  # environment.gnome.excludePackages = with pkgs; [
  #    gnome-tour
  #    gnome-user-docs
  # ];

  environment.systemPackages =
    with pkgs;
    [
      gnomeExtensions.appindicator
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.caffeine

      gnomeExtensions.iso-clock
      gnomeExtensions.blur-my-shell
    ]
    ++ [
      # blackbox-terminal
      gnome-frog
    ];
}
