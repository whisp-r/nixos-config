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
      vesktop
      zig
      zls
      firefox-devedition
      # android-studio-full
    ]
    ++ [
      # custom packages
      edu-sync-cli
    ];

  programs = {
    thunderbird.enable = true;
  };

  # nixpkgs.config.android_sdk.accept_license = true;
}
