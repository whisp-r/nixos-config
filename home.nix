{ config, pkgs, unstable, ... }:

{
  home.username = "whiisper";
  home.homeDirectory = "/home/whiisper";

  # SIMPLE apps should be defined here
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fastfetch

    btop

    unzip
    p7zip # 7z

    neovim # not configured via NixOS or home-manager

    # Astronvim requirements:
    nerd-fonts.jetbrains-mono
    ripgrep # live grep file search (<Leader>fw)
    # lazygit # git ui toggle terminal (<Leader>tl or <Leader>gg)
    gdu # disk usage toggle terminal (<Leader>tu)
    bottom # process viewer toggle terminal (<Leader>tt)
    python314 # python repl toggle terminal (<Leader>tp)
    nodejs_24 # is needed for a lot of the LSPs, and for the node repl toggle terminal (<Leader>tn)

    # rust stuff
    rustc
    cargo
    rust-analyzer
    rustfmt

    gcc
    curl
  ];

  # More DEEP-CONFIGURATION apps should be defined here
  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = { enable = true; };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    plugins = { lazygit = pkgs.yaziPlugins.lazygit; };
    keymap = {
      mgr.prepend_keymap = [{
        on = [ "g" "i" ];
        run = "plugin lazygit";
        desc = "run lazygit";
      }];
    };
  };

  programs.lazygit = { enable = true; };

  programs.git = {
    enable = true;

    userName = "whisp-r"; # WARN: no signed commits
    userEmail = "188515789+whisp-r@users.noreply.github.com";

    extraConfig = { init.defaultBranch = "main"; };
  };

  programs.zed-editor = {
    enable = true;
    package = unstable.zed-editor;

    extensions = [ "catppuccin" "catppuccin-icons" ];

    userSettings = {
      telemetry.metrics = false;
      disable_ai = true;

      vim_mode = true;
      ui_font_size = 16;
    };
  };

  programs.plasma = {
    enable = true;

    workspace = { lookAndFeel = "org.kde.breezedark.desktop"; };
  };

  programs.konsole = {
    enable = true;

    defaultProfile = "whitefatalis-konsole";
    profiles = {
      whitefatalis-konsole = {
        font = {
          name = "JetBrainsMono Nerd Font Mono";
          size = 16;
        };

      };
    };
  };

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "alanpeabody";
    };

    history.size = 5000;
  };

  # Nicely reload system units when changing configs
  # systemd.user.startServices = "sd-switch";

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
