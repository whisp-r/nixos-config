{ pkgs, inputs, system, ... }:

let
  edu-sync-cli = inputs.edu-sync-nix.packages.${system}.default;
in
{
  # services.xserver.enable = true;

  environment.systemPackages =
    with pkgs;
    [
      vesktop
      zig
      zls
      onlyoffice-desktopeditors
    ]

    ++ [
      # custom packages
      edu-sync-cli
    ];

  programs = {
    thunderbird.enable = true;
  };
}
