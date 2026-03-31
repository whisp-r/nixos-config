{ pkgs, lib, ... }:

{
  services = {
    atuin = {
      enable = true;
      openFirewall = true;
    };
  };

  programs = {
    firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };

    fish = {
      enable = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        user.name = "whisp-r";
        user.email = "188515789+whisp-r@users.noreply.github.com";
      };
    };
    lazygit.enable = true;

  };

  # https://forum.atuin.sh/t/getting-the-daemon-working-on-nixos/334/3
  systemd.user.services.atuind = {
    enable = true;

    environment = {
      ATUIN_LOG = "info";
    };
    serviceConfig = {
      ExecStart = "${pkgs.atuin}/bin/atuin daemon";
    };
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
  };

  environment.systemPackages = with pkgs; [
    wayland-utils
    wl-clipboard
    vscode-runner

    # basic
    vim
    wget
    curl
    tree
    htop
    btop
    eza
    bat
    tealdeer
    fastfetch

    # gnome console
    ueberzugpp

    # search
    yazi
    fzf
    ripgrep

    # archives
    unzip
    p7zip # 7z
    rar
    rar2fs

    # img/video
    ffmpeg_6
    imagemagick

    # encryption/secrets
    age

    # text editor
    helix

    atuin

    # GUI

    # kdePackages.partitionmanager
    # kdePackages.ksystemlog

    # kdePackages.ark
    # kdePackages.filelight

    # kdePackages.kcolorchooser
    # kdePackages.kcalc
    # kdePackages.kolourpaint

    # kdePackages.sddm-kcm
    # kdePackages.isoimagewriter

    # kdePackages.okular
    # kdePackages.gwenview

    # onlyoffice-desktopeditors

    keepassxc

    mpv

    # zed-editor-fhs
    vscode-fhs
  ];
}
