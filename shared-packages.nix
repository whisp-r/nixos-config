{ pkgs, ... }:

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

    zsh = {
      enable = true;

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
          "direnv"
        ];
        theme = "alanpeabody";
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };

    git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        user.name = "whisp-r";
        user.email = "188515789+whisp-r@users.noreply.github.com";
      };
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
      plugins = {
        lazygit = pkgs.yaziPlugins.lazygit;
      };
      keymap = {
        mgr.prepend_keymap = [
          {
            on = [
              "g"
              "i"
            ];
            run = "plugin lazygit";
            desc = "run lazygit";
          }
        ];
      };
    };
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
    fzf

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
    zed-editor-fhs
    vscode-fhs
    helix
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

    keepassxc

    mpv

  ];
}
