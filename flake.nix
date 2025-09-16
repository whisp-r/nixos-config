{
  description = "Main machine flake by whiisper";

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
    input@{ nixpkgs, nixpkgs-unstable, home-manager, plasma-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      unstable = import nixpkgs-unstable { inherit system; };
    in
    {
      nixosConfigurations = {
        whitefatalis = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit unstable; };
          modules = [

            ./configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit unstable; };

              # fixes some error with home-manager-gen service
              home-manager.backupFileExtension = "backup";

              # plasma manager
              home-manager.sharedModules =
                [ plasma-manager.homeModules.plasma-manager ];

              # this should point to the home.nix file
              home-manager.users.whiisper = import ./home.nix;
            }
          ];
        };
      };
    };
}
