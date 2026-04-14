{ pkgs, ... }:

{
  services.desktopManager.plasma6 = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    config.common.default = "kde";
  };
  environment.systemPackages = with pkgs; [
    kdePackages.ksystemlog
    kdePackages.partitionmanager
    kdePackages.isoimagewriter
    kdePackages.sddm-kcm

    kdePackages.ark
    kdePackages.filelight

    kdePackages.kcolorchooser
    kdePackages.kcalc
    kdePackages.kolourpaint

    kdePackages.okular
    kdePackages.gwenview

    vscode-runner
  ];
}
