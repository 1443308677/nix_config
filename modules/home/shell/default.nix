{ config, pkgs, ... }:

{
    imports = [
        ./alacritty
        ./bash
        ./fish
        ./starship
    ];
}
