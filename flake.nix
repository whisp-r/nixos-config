{
  description = "New simpler whisp-r config, beucase i learned better";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";

    nix-maid.url = "github:viperML/nix-maid";

    edu-sync-nix = {
      url = "github:Marc55s/edu-sync-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      nix-maid,
      ...
    }@inputs:
    let
      username = "whiisper";

      pkgs-stable = import nixpkgs-stable {
        system = "x86_64-linux";
        # To use Chrome, we need to allow the
        # installation of non-free software.
        config.allowUnfree = true;
      };
      specialArgs = { inherit inputs username pkgs-stable; };
    in
    {
      nixosConfigurations = {

        black-fatalis =
          let
            hostname = "black-fatalis";
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = [
              # { nixpkgs.hostPlatform = system; } # defined in hardware config
              { networking.hostName = hostname; }

              ./${hostname}/hardware-configuration.nix
              ./${hostname}/configuration.nix
              ./${hostname}/base.nix

              nix-maid.nixosModules.default
            ];
          };

        shrieking-legiana =
          let
            hostname = "shrieking-legiana";
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = [
              { networking.hostName = hostname; }

              ./${hostname}/hardware-configuration.nix
              ./${hostname}/configuration.nix
              ./${hostname}/base.nix

              nix-maid.nixosModules.default
            ];
          };

      };

    };
}
