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
    shell = pkgs.zsh;

    maid = ./maid.nix;
  };
}
