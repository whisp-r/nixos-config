{ config, pkgs, ... }:

let
  profileName = "custom-profile";
  font = "Fragment Mono";
  fontSize = 12;
in {
  programs.konsole = {
    enable = true;

    defaultProfile = profileName;

    profiles = {
      profileName = {
        font = {
          name = font;
          size = fontSize;
        };
      };
    };
  };
}
