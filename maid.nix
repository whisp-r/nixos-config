{
  config,
  pkgs,
  lib,
  ...
}:

let
  repo_location = "{{home}}/nixos-config";
  dotfiles_location = "${repo_location}/dotfiles";
in
{
  file.xdg_config."zed/".source = "${dotfiles_location}/zed/";
  file.xdg_config."yazi/".source = "${dotfiles_location}/yazi/";
  file.xdg_config."atuin/".source = "${dotfiles_location}/atuin/";
  file.xdg_config."helix/".source = "${dotfiles_location}/helix/";
}
