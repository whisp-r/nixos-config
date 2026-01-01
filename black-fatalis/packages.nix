{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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

    zed-editor-fhs
  ];
}
