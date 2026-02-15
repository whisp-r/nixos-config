{ pkgs, ... }:

{
  # services.xserver.enable = true;

  environment.systemPackages =
    with pkgs;
    [
      # none
      imhex
      vesktop
      krita
    ]
    ++ [
      (
        pkgs.catppuccin-sddm.override {
          flavor = "latte";
          accent = "mauve";
          font = "Noto Sans";
          fontSize = "16";
        }
      )
    ];
}
