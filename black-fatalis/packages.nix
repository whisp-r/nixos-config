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
      #upscayl

      # games
      #ludusavi

      # anime
      #ani-cli
      #anime4k

      krita

      losslesscut-bin

      # discord
      vesktop

      # zed-editor-fhs
    ]
    ++ [ edu-sync-cli ];
}
