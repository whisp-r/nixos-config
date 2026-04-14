{ pkgs, ... }:

# https://discourse.nixos.org/t/how-to-configure-a-graphical-boot-screen-with-luks-unlock/63357
{
  boot = {

    # plymouth = {
    #   enable = true;
    #   # theme = "rings";
    #   # themePackages = with pkgs; [
    #   #   # By default we would install all themes
    #   #   (adi1090x-plymouth-themes.override {
    #   #     selected_themes = [ "rings" ];
    #   #   })
    #   # ];
    # };

    # plymouth, showing after LUKS unlock
    plymouth.enable = true;
    # plymouth.font = "${pkgs.hack-font}/share/fonts/truetype/Hack-Regular.ttf";
    # plymouth.logo = "${pkgs.nixos-icons}/share/icons/hicolor/128x128/apps/nix-snowflake.png";

    # silence first boot output
    consoleLogLevel = 3;
    initrd.verbose = false;
    initrd.systemd.enable = true;
    kernelParams = [
        "quiet"
        "splash"
        "intremap=on"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=auto"
    ];

    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 1;
  };
}
