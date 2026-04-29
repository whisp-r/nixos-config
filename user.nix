{
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
      "vboxsf"
    ]; 
    shell = pkgs.fish;
    maid = ./maid.nix;
  };
}
