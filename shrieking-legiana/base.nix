{
  pkgs,
  ...
}:
{
  imports = [
    ../user.nix
    ../experimental.nix

    ../sound.nix
    # ../printer.nix

    ../locale.nix
    ../environment.nix
    ../nix-ld.nix

    ../wayland.nix
    # ../kde.nix
    ../gnome.nix

    # ../plasma-login.nix
    # ../sddm.nix

    # ../plymouth.nix
    ../autologin.nix
    ../sudo-rs.nix

    ../shared-packages.nix
    ./packages.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  hardware.graphics.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Polkit
  security.polkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Firmware updating/settings
  # services.fwupd.enable = true;

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      liberation_ttf
      fragment-mono

      nerd-fonts.symbols-only
      nerd-fonts.jetbrains-mono
    ];
  };

}
