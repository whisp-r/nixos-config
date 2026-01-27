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
    ]
    ++ [
      # custom packages
      edu-sync-cli
    ];

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #   dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #   localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  # };
}
