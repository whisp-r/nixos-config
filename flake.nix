{

  description = "New simpler whisp-r config, beucase i learned better";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
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
      specialArgs = { inherit inputs username; };
      homeManagerModuleCommon = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users = {
          ${username} = ./home.nix;
        };
        home-manager.extraSpecialArgs = specialArgs;
      };
    in
    {
      nixosConfigurations = {

        black-fatalis =
          let
            hostnameNew = "black-fatalis";
            # username = "whiisper";
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = [
              { nixpkgs.hostPlatform = "x86_64-linux"; }
              { networking.hostName = "${hostnameNew}"; }

              (./. + "/${hostnameNew}/hardware-configuration.nix")
              (./. + "/${hostnameNew}/configuration.nix")
              (./. + "/${hostnameNew}/base.nix")

              home-manager.nixosModules.home-manager
              homeManagerModuleCommon
            ];
          };

        shrieking-legiana =
          let
            hostnameNew = "shrieking-legiana";
            # username = "whiisper";
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = [
              { nixpkgs.hostPlatform = "x86_64-linux"; }
              { networking.hostName = "${hostnameNew}"; }

              (./. + "/${hostnameNew}/hardware-configuration.nix")
              (./. + "/${hostnameNew}/configuration.nix")
              (./. + "/${hostnameNew}/base.nix")

              home-manager.nixosModules.home-manager
              homeManagerModuleCommon
            ];
          };

      };

    };
}
