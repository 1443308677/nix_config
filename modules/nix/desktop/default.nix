{ config, pkgs, ... }:

{
    imports = [
        ./pipewire.nix
        ./niri_de/niri.nix
        ./niri_de/noctalia.nix
    ];
}
