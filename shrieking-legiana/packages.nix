{
  pkgs,
  inputs,
  ...
}:

let
  whisp = pkgs.callPackage ../custom-packages/whisp {};
  edu-sync-cli = inputs.edu-sync-nix.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  environment.systemPackages =
    with pkgs;
    [
      vesktop
      zig
      zls
      firefox-devedition
      bash-language-server
      # ghostty
      jujutsu
      imhex

      keepassxc
      mpv
      vscode-fhs
      onlyoffice-desktopeditors
    ]
    ++ [
      # custom packages
      edu-sync-cli
      whisp
    ];

  programs = {
    thunderbird.enable = true;

    firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };

  };
}
