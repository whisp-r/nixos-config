{ config, pkgs, ... }:

{
  programs = {
    firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
    thunderbird.enable = true;
    localsend.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wayland-utils
    wl-clipboard

    # CLI
    vim
    wget
    curl
    fastfetch
    tree

    htop
    # btop
    # eza
    # tealdeer
    # fzf

    # archives
    unzip
    p7zip # 7z
    rar
    rar2fs

    ffmpeg_6
    imagemagick

    # encryption/secrets
    age
    sops

    # text editor
    neovim # not configured via NixOS or home-manager (https://github.com/whisp-r/nvim-config)

    # Astronvim requirements:
    ripgrep # live grep file search (<Leader>fw)
    # lazygit # git ui toggle terminal (<Leader>tl or <Leader>gg) check ./git.nix
    gdu # disk usage toggle terminal (<Leader>tu)
    bottom # process viewer toggle terminal (<Leader>tt)
    #python314 # python repl toggle terminal (<Leader>tp)
    nodejs_24 # is needed for a lot of the LSPs, and for the node repl toggle terminal (<Leader>tn)

    konsave

    # GUI

    kdePackages.partitionmanager
    kdePackages.ksystemlog

    kdePackages.ark
    kdePackages.filelight

    kdePackages.kcolorchooser
    kdePackages.kcalc
    kdePackages.kolourpaint

    kdePackages.sddm-kcm
    kdePackages.isoimagewriter

    kdePackages.okular
    kdePackages.gwenview

    onlyoffice-desktopeditors

    # keepassxc

    # mpv

  ];
}
