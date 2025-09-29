{ config, pkgs, ... }:

{
  home.packages = [ pkgs.gh ];

  programs.git = {
    enable = true;

    extraConfig = { init.defaultBranch = "main"; };
  };

  programs.lazygit = { enable = true; };
}
