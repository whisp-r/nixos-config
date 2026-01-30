{ ... }:

{

  environment.variables = {
    # Keep home directories clean by using XDG locations
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    EDITOR = "hx";
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # enable wayland support in chromium and electron-based apps
    MOZ_ENABLE_WAYLAND = "1"; # enable wayland support in Firefox
  };
}
