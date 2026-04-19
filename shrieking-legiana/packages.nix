{
  pkgs,
  pkgs-stable,
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
      # ghostty
    ]
    ++ [
      # custom packages
      edu-sync-cli
    ] ++ [
      pkgs-stable.ghostty
    ];

  programs = {
    thunderbird.enable = true;
  };
}
