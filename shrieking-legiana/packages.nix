{ pkgs, ... }:

{
  # services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    # none
    imhex
    vesktop
    krita
  ];
}
