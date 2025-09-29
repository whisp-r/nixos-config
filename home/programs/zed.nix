{ config, pkgs, unstable, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = unstable.zed-editor;

    extensions = [ "catppuccin" "catppuccin-icons" ];

    userSettings = {
      telemetry.metrics = false;
      disable_ai = true;

      vim_mode = true;
      ui_font_size = 16;
    };
  };
}
