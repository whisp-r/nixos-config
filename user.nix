{
  config,
  pkgs,
  username,
  ...
}:

{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;

    # maid.imports = [ ./maid.nix ];
    maid = ./maid.nix;
  };

  # maid.sharedModules = [./maid.nix];
}
