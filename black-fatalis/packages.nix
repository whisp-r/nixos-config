{
  pkgs,
  system,
  inputs,
  ...
}:

let
  edu-sync-cli = inputs.edu-sync-nix.packages.${system}.default;
in
{
  environment.systemPackages =
    with pkgs;
    [
      imhex
      krita
      losslesscut-bin
      vesktop

      jetbrains.clion

      nixfmt
      nixd
      nil

      zed-editor-fhs

      kdePackages.partitionmanager
      kdePackages.ksystemlog

      kdePackages.ark
      kdePackages.filelight

      kdePackages.kcolorchooser
      kdePackages.kcalc
      kdePackages.kolourpaint

      kdePackages.sddm-kcm
      kdePackages.isoimagewriter

      kdePackages.okular
      kdePackages.gwenview

      onlyoffice-desktopeditors

    ]
    ++ [
      # custom packages
      edu-sync-cli
    ];

  programs = {
    thunderbird.enable = true;
    localsend.enable = true;

  };

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #   dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #   localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  # };
}
