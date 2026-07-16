{ config, pkgs, ... }:

{
    imports = [
        ./boot.nix
        ./laptop-hardware.nix
    ];
}
