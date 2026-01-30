{
  description = "New simpler whisp-r config, beucase i learned better";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-maid.url = "github:viperML/nix-maid";

    edu-sync-nix = {
      url = "github:Marc55s/edu-sync-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-maid,
      ...
    }@inputs:
    let
      username = "whiisper";
      system = "x86_64-linux";

      specialArgs = { inherit inputs username system; };
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
              { nixpkgs.hostPlatform = system; }
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
              { nixpkgs.hostPlatform = system; }
              { networking.hostName = hostname; }

              ./${hostname}/hardware-configuration.nix
              ./${hostname}/configuration.nix
              ./${hostname}/base.nix

            ];
          };

      };

    };
}
