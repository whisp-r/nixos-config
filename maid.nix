{
  config,
  pkgs,
  lib,
  ...
}:

let
  repo_location = "{{home}}/nixos-config/";
in
{
  file.xdg_config."zed/".source = repo_location + "/dotfiles/zed/";
}
