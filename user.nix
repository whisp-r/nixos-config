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
    ]; 
    shell = pkgs.fish;
    maid = ./maid.nix;
  };
}
