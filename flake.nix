{

  description = "New simpler whisp-r config, beucase i learned better";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {

        black-fatalis =
          let
            hostnameNew = "black-fatalis";
            username = "whiisper";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit inputs;
              inherit username;
            };

            modules = [
              { nixpkgs.hostPlatform = "x86_64-linux"; }
              { networking.hostName = "${hostnameNew}"; }

              (./. + "/${hostnameNew}/hardware-configuration.nix")
              (./. + "/${hostnameNew}/configuration.nix")
              (./. + "/${hostnameNew}/base.nix")
            ];
          };

        shrieking-legiana =
          let
            hostnameNew = "shrieking-legiana";
            username = "whiisper";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit inputs;
              inherit username;
            };

            modules = [
              { nixpkgs.hostPlatform = "x86_64-linux"; }
              { networking.hostName = "${hostnameNew}"; }

              (./. + "/${hostnameNew}/hardware-configuration.nix")
              (./. + "/${hostnameNew}/configuration.nix")
              (./. + "/${hostnameNew}/base.nix")
            ];
          };

      };

    };
}
