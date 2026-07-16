{ config, pkgs, ... }:

let
    myAliases = import ../aliases.nix;
in

{
    # Bash：登录 shell，自动 exec 进 fish
    programs.bash = {
        enable = true;
        shellAliases = myAliases;
        initExtra = builtins.readFile ./bashrc;
    };
}
