{
  pkgs,
  inputs,
  ...
}:

let
  whisp = pkgs.callPackage ../custom-packages/whisp/default.nix;
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
      edu-sync-cli
      whisp
    ];

  programs = {
    thunderbird.enable = true;
  };
}
