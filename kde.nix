{ ... }:

{
  services.desktopManager.plasma6 = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    config.common.default = "kde";
  };
}
