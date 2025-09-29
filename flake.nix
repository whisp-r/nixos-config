{
  description = "Flake by whisp-r";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    inputs@{ nixpkgs, nixpkgs-unstable, home-manager, plasma-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      unstable = import nixpkgs-unstable { inherit system; };
    in {
      nixosConfigurations = {
        whitefatalis = let
          username = "whiisper";
          specialArgs = {
            inherit username;
            inherit unstable;
          };
        in nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./hosts/white-fatalis
            # ./users/${username}/nixos.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              # home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit unstable;
              };

              # fixes some error with home-manager-gen service
              home-manager.backupFileExtension = "backup";

              # plasma manager
              home-manager.sharedModules =
                [ plasma-manager.homeModules.plasma-manager ];

              # this should point to the home.nix file
              home-manager.users.${username} =
                import ./users/${username}/home.nix;
            }
          ];
        };
      };
    };
}
