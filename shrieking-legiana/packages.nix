{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # none
    imhex
    vesktop
  ];
}
