{ config, pkgs, ... }:

let
    myAliases = import ../aliases.nix;
in

{
    home.packages = with pkgs; [ fastfetch ];

    programs.fish = {
        enable = true;
        shellAliases = myAliases;
        shellInit = builtins.readFile ./config.fish;
    };
}
