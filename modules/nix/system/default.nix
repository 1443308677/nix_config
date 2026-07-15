{ config, pkgs, ... }:

{
    imports = [
        ./boot.nix
        ./local.nix
        ./net.nix
        ./nix-ld.nix
        ./nix-settings.nix
        ./vmware.nix
    ];
}
