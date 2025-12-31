{ config, pkgs, username, ...}:
{
    imports =
        [
            ../sound.nix
            ../printer.nix
            ../locale.nix
            ../kde.nix
            ../sddm.nix
            ../environment.nix
            ../experimental.nix

            ../shared-packages.nix
            ./packages.nix
        ];

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

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
    services.libinput.enable = true;

    # Firmware updating/settings
    services.fwupd.enable = true;

    services.xwayland.enable = true;

    fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
            # normal fonts
            liberation_ttf
            fragment-mono

            # nerd-fonts
            nerd-fonts.symbols-only
            nerd-fonts.jetbrains-mono
        ];
    };

    users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };
}
