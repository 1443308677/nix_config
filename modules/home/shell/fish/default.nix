{ config, pkgs, ... }:

let
    myAliases = { ".." = "cd .."; };
in

{
    home.packages = with pkgs; [ fastfetch ];

    programs.fish = {
        enable = true;
        shellAliases = myAliases;
        shellInit = builtins.readFile ./config.fish;
    };
}
