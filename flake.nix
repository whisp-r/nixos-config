{
  description = "New simpler whisp-r config, beucase i learned better";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    edu-sync-nix = {
      url = "github:Marc55s/edu-sync-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      username = "whiisper";
      system = "x86_64-linux";

      specialArgs = { inherit inputs username system; };

      homeManagerModuleCommon = {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users = {
            ${username} = ./home.nix;
          };
          backupFileExtension = "backup";
          extraSpecialArgs = specialArgs;
        };
      };

    in
    {
      nixosConfigurations = {

        black-fatalis =
          let
            hostname = "black-fatalis";
            # system = "x86_64-linux";
            # username = "whiisper";
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = [
              { nixpkgs.hostPlatform = system; }
              { networking.hostName = hostname; }

              ./${hostname}/hardware-configuration.nix
              ./${hostname}/configuration.nix
              ./${hostname}/base.nix

              home-manager.nixosModules.home-manager
              homeManagerModuleCommon
            ];
          };

        shrieking-legiana =
          let
            hostname = "shrieking-legiana";
            # system = "x86_64-linux";
            # username = "whiisper";
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = [
              { nixpkgs.hostPlatform = system; }
              { networking.hostName = hostname; }

              ./${hostname}/hardware-configuration.nix
              ./${hostname}/configuration.nix
              ./${hostname}/base.nix

              home-manager.nixosModules.home-manager
              homeManagerModuleCommon
            ];
          };

      };

    };
}
