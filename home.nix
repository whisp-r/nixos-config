{ config, pkgs, username, ... }:

{
  home = {
    homeDirectory = "/home/${username}";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "25.11"; # Please read the comment before changing.
  };

  programs = {
    home-manager.enable = true;

    atuin = {
      enable = true;
      daemon.enable = true;
      settings = {
        search_mode = "fuzzy";
      };
    };

    zsh = {
        enable = true;

        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "direnv"
          ];
          theme = "alanpeabody";
        };

        history.size = 10000;
    };

    lazygit.enable = true;

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
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };

    btop.enable = true; # replacement for htop/nvtop
    eza.enable = true; # nicer looking `ls` command
    bat.enable = true; # nicer looking `cat` command
    ssh.enable = true;
    fzf.enable = true;

    tealdeer = {
      enable = true;
      enableAutoUpdates = true;
    };

    # GUI
    keepassxc.enable = true;
    mpv.enable = true;

    git = {
      enable = true;

      settings = {
        user.name = "whisp-r";
        user.email = "188515789+whisp-r@users.noreply.github.com";

        init.defaultBranch = "main";
      };
    };

    vscode = {
      enable = true;
      package = pkgs.vscode-fhs;
    };


  };
}
