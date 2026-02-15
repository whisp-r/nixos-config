{ ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;

    theme = "catppuccin-latte-mauve";
    # theme = "breeze";
  };
}
