{
  pkgs,
  inputs,
  ...
}:

let
  whisp = pkgs.callPackage ../custom-packages/whisp {};
  edu-sync-cli = inputs.edu-sync-nix.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  environment.systemPackages =
    with pkgs;
    [
      imhex
      krita
      vesktop

      zed-editor-fhs
      firefox-devedition
      devenv
      ghostty
    ]
    ++ [
      # custom packages
      edu-sync-cli
      whisp
    ];

  programs = {
    thunderbird.enable = true;
    localsend.enable = true;

    firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };

}
