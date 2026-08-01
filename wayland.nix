
{ pkgs, ... }:

{
  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    wayland-utils
    wl-clipboard
  ];
}
