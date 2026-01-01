{ pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices."luks-53e7c03d-d40e-43ff-9c19-a12301792bfd".device =
    "/dev/disk/by-uuid/53e7c03d-d40e-43ff-9c19-a12301792bfd";
  networking.hostName = "black-fatalis"; # Define your hostname.

  # Pick only one of the below networking options.
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest and most distros use

  system.stateVersion = "25.05"; # Did you read the comment?
}
