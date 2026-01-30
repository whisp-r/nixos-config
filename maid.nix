{
  config,
  pkgs,
  lib,
  ...
}:

# let
#   repo_location = "{{home}}/nixos-config/";
# in
{
  # maid = {
  file.xdg_config."zed/".source = "{{home}}/nixos-config/dotfiles/zed/";
  
  file.home.".local/bin/hello.sh" = {
    text = ''
      echo Hello $USER
    '';
    executable = true;
  };
  # };
}
