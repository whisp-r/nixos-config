{ pkgs, ... }:

{
  # services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    # none
    imhex
    vesktop
    firefox-devedition
    krita
    jetbrains.webstorm
    docker

    ghidra
    wireshark
    obsidian
  ];
}
