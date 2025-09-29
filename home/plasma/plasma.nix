{ config, pkgs, ... }:

let
  mainFont = "Liberation Sans";
  mainFontPointSize = 12;
  monoFont = "Fragment Mono";
in {
  programs.plasma = {
    enable = true;

    workspace = { lookAndFeel = "org.kde.breezedark.desktop"; };
    fonts = {
      general = {
        family = mainFont;
        pointSize = mainFontPointSize;
      };
      fixedWidth = {
        family = mainFont;
        pointSize = mainFontPointSize;
      };
      small = {
        family = monoFont;
        pointSize = (mainFontPointSize - 2);
      };
      toolbar = {
        family = mainFont;
        pointSize = mainFontPointSize;
      };
      menu = {
        family = mainFont;
        pointSize = mainFontPointSize;
      };
      windowTitle = {
        family = mainFont;
        pointSize = mainFontPointSize;
      };
    };
    kwin = {
      effects = {
        desktopSwitching = {
          animation = "fade";
          navigationWrapping = false;
        };
        shakeCursor.enable = false;
      };
      nightLight = {
        enable = true;
        mode = "times";
        temperature = {
          day = 6500; # Kelvin
          night = 4500;
        };
        time = {
          evening = "19:00";
          morning = "08:00";
        };
        transitionTime = 90; # 90 mins
      };
      virtualDesktops = {
        names = [
          "Yazi/Git"
          "Main"
          "Social/Music"
          "Project_L"
          "Project_Main"
          "Project_R"
        ];
        rows = 2;
      };
    };
  };

}
