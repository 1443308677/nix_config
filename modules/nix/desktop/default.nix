{ config, pkgs, ... }:

{
    imports = [
        ./pipewire.nix
        # ./gnome.nix
        ./niri_de/niri.nix
        ./niri_de/noctalia.nix
    ];
}
