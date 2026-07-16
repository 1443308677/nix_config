{
    description = "nixos-config — unified NixOS configuration for vmware & laptop";

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

            # Secrets: read once here, passed to modules via specialArgs
            githubAccessToken = builtins.readFile ./secrets/github-access-token;

            # Common parameters shared by all configurations
            baseSpecialArgs = {
                inherit system githubAccessToken;
                userName = "jun";
                homeDirectory = "/home/jun";
            };

            mkNixosConfig = { hostName, extraModules, extraSpecialArgs ? {} }:
                nixpkgs.lib.nixosSystem {
                    inherit system;
                    specialArgs = baseSpecialArgs // { inherit hostName; } // extraSpecialArgs;
                    modules = extraModules;
                };

            mkHomeConfig = { hostName, extraModules ? [] }:
                home-manager.lib.homeManagerConfiguration {
                    inherit pkgs;
                    extraSpecialArgs = baseSpecialArgs // { inherit hostName; };
                    modules = [
                        ./modules/home
                    ] ++ extraModules;
                };
        in {
            # ---- NixOS System Configurations ----
            nixosConfigurations = {
                vmware = mkNixosConfig {
                    hostName = "vmware";
                    extraModules = [
                        niri-flake.nixosModules.niri
                        noctalia.nixosModules.default
                        ({ pkgs, ... }: {
                            programs.niri.package = pkgs.niri;
                        })
                        ./hosts/vmware/hardware-configuration.nix
                        ./modules/nixos
                        ./hosts/vmware
                    ];
                };

                laptop = mkNixosConfig {
                    hostName = "laptop";
                    extraModules = [
                        niri-flake.nixosModules.niri
                        ({ pkgs, ... }: {
                            programs.niri.package = pkgs.niri;
                        })
                        noctalia.nixosModules.default
                        ./hosts/laptop/hardware-configuration.nix
                        ./modules/nixos
                        ./hosts/laptop
                    ];
                };
            };

            # ---- Home Manager User Configurations ----
            homeConfigurations = {
                vmware = mkHomeConfig {
                    hostName = "vmware";
                    extraModules = [
                        ./hosts/vmware/home.nix
                        ./modules/home/rust.nix
                    ];
                };

                laptop = mkHomeConfig {
                    hostName = "laptop";
                    extraModules = [
                        ./hosts/laptop/home.nix
                    ];
                };
            };
        };
}
