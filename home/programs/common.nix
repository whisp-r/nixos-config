{ config, lib, pkgs, ... }:

{
  # SIMPLE packages (without the package.enable option)
  home.packages = with pkgs; [
    # archives
    unzip
    p7zip # 7z

    # misc
    fastfetch
    tree

    # utils
    htop

    # text editor
    neovim # not configured via NixOS or home-manager (https://github.com/whisp-r/nvim-config)

    # Astronvim requirements:
    ripgrep # live grep file search (<Leader>fw)
    # lazygit # git ui toggle terminal (<Leader>tl or <Leader>gg) check ./git.nix
    gdu # disk usage toggle terminal (<Leader>tu)
    bottom # process viewer toggle terminal (<Leader>tt)
    python314 # python repl toggle terminal (<Leader>tp)
    nodejs_24 # is needed for a lot of the LSPs, and for the node repl toggle terminal (<Leader>tn)

    # rust
    rustc
    cargo
    rust-analyzer
    rustfmt

    gcc
  ];

  # DEEP-CONFIG packages (with the enable option)
  programs = {
    btop.enable = true; # replacement for htop/nvtop
    eza.enable = true; # nicer looking `ls` command
    bat.enable = true; # nicer looking `cat` command
    ssh.enable = true;
  };
}
