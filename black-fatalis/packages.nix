{
  pkgs,
  inputs,
  ...
}:

let
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
      # android-studio
      devenv
    ]
    ++ [
      # custom packages
      edu-sync-cli
    ];

  nixpkgs.config.android_sdk.accept_license = true;

  programs = {
    thunderbird.enable = true;
    localsend.enable = true;

    # steam = {
    #   enable = true;
    #   remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    #   dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    #   localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    # };
  };

}
