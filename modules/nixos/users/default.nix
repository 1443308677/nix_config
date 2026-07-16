# User account definition (parameterized by userName)
{ config, pkgs, userName, ... }:

{
    users.users."${userName}" = {
        isNormalUser = true;
        description = userName;
        extraGroups = [ "networkmanager" "wheel" "disk" "video" ];
        shell = pkgs.bash;
    };
}
