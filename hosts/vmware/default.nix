{ config, pkgs, ... }:

{
    imports = [
        ./boot.nix
        ./vmware-hardware.nix
    ];
}
