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
    thunderbird.enable = true;
    localsend.enable = true;
    lazygit.enable = true;

    fish = {
      enable = true;
    };

    # zsh = {
    #   enable = true;

    #   enableCompletion = true;
    #   autosuggestions.enable = true;
    #   syntaxHighlighting.enable = true;

    #   ohMyZsh = {
    #     enable = true;
    #     plugins = [
    #       "git"
    #       "direnv"
    #     ];
    #     theme = "alanpeabody";
    #   };
    # };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableFishIntegration = true;
    };

    git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        user.name = "whisp-r";
        user.email = "188515789+whisp-r@users.noreply.github.com";
      };
    };
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

    # CLI
    vim
    wget
    curl
    fastfetch
    tree
    htop
    btop
    eza
    bat
    tealdeer

    # search
    yazi
    fzf
    ripgrep # live grep file search (<Leader>fw)

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
    helix

    konsave
    atuin

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

    keepassxc

    mpv

    # zed-editor-fhs
    # vscode-fhs
  ];
}
