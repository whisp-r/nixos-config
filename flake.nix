{
  description = "New simpler whisp-r config, beucase i learned better";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nix-maid.url = "github:viperML/nix-maid";

    edu-sync-nix = {
      url = "github:Marc55s/edu-sync-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nix-maid,
      nixos-wsl,
      ...
    }@inputs:
    let
      username = "whiisper";
      specialArgs = { inherit inputs username; };
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

        wsl-nixos =
          let
            hostname = "wsl-nixos";
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            modules = [
              { nixpkgs.hostPlatform = system; } # defined in hardware config
              { wsl.wslConf.network.hostname = hostname; }

              ./${hostname}/configuration.nix
              ./${hostname}/base.nix

              nix-maid.nixosModules.default
              nixos-wsl.nixosModules.default
            ];
          };

      
      };
    };
}
