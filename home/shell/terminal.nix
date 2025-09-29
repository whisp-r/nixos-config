{ config, pkgs, ... }:

# terminals (konsole is part of plasma module)

{
  programs.alacritty = { enable = true; };
}
