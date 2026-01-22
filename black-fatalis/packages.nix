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
    ++ [ # custom packages
      edu-sync-cli
    ];
}
