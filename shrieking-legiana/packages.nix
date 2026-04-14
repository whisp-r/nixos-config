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
      vesktop
      zig
      zls
    ]
    ++ [
      # custom packages
      edu-sync-cli
    ];

  programs = {
    thunderbird.enable = true;
  };
}
