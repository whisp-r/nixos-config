{ config, pkgs, username, ... }:

{
  ## User related

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;

    # theme = "breeze";
  };

  # Set your time zone.
  time.timeZone = "Europe/Zagreb";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_NUMERIC = "hr_HR.UTF-8";
    LC_TIME = "en_CA.UTF-8";
    LC_MONETARY = "hr_HR.UTF-8";
    LC_MEASUREMENT = "hr_HR.UTF-8";
    LC_PAPER = "hr_HR.UTF-8";
    LC_ADDRESS = "hr_HR.UTF-8";
    LC_NAME = "hr_HR.UTF-8";
    LC_TELEPHONE = "hr_HR.UTF-8";
    LC_IDENTIFICATION = "hr_HR.UTF-8";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # ENABLE EXPERIMENTAL FEATURES / FLAKES
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
    nnn
    wl-clipboard
  ];

  # ZSH (has to be enabled here for home manager, error explanation)
  programs.zsh.enable = true;

  # fonts
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

  # Enable sound.
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
