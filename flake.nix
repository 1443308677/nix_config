{
    description = "vm_config";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
        home-manager.url = "github:nix-community/home-manager/release-26.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        niri-flake.url = "github:sodiboo/niri-flake";
        noctalia.url = "github:noctalia-dev/noctalia/cachix";
    };

    outputs = {self, nixpkgs, home-manager, niri-flake, noctalia, ...}:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in {
        nixosConfigurations = {
            vmware = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    niri-flake.nixosModules.niri
                    noctalia.nixosModules.default
                    ({ ... }: {
                        programs.niri.package = niri-flake.packages.${system}.niri-unstable;
                    })
                    ./hardware-configuration.nix
                    ./modules/nix/system
                    ./modules/nix/desktop
                    ./modules/nix/programs
                    ./modules/nix/users
                ];
            };
        };

        homeConfigurations = {
            vmware = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [./modules/home];
            };
        };
    };
}
