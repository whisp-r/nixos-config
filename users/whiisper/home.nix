{ pkgs, ... }:

{

  imports = [
    ../../home/core.nix

    ../../home/plasma
    ../../home/programs
    ../../home/shell
  ];

  programs.git = {
    userName = "whisp-r";
    userEmail = "188515789+whisp-r@users.noreply.github.com";
  };
}
