{ pkgs, ... }:

{
  services = {
    atuin = {
      enable = true;
      openFirewall = true;
    };
  };

  programs = {
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

  environment.systemPackages = with pkgs; [
    unzip
    p7zip # 7z
    rar

    nixfmt
    nixd

    # cli
    wget
    curl
    fzf
    ripgrep
    ffmpeg_6
    imagemagick

    tree
    eza
    bat

    tealdeer
    fastfetch

    atuin

    # tui
    htop
    btop

    vim
    helix

    yazi
  ];
}
