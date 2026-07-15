{ config, pkgs, ... }:

{
    users.users."jun" = {
        isNormalUser = true;
        description = "jun";
        extraGroups = [ "networkmanager" "wheel" "disk" "video" ];
        shell = pkgs.bash;
    };
}
