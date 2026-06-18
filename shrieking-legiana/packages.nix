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
      bash-language-server
      # ghostty
      jujutsu
      imhex
    ]
    ++ [
      # custom packages
      # edu-sync-cli
    ];

  programs = {
    thunderbird.enable = true;
  };
}
