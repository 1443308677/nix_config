{ config, pkgs, ... }:

{
    services.xserver = {
        enable = true;
        xkb = {
            layout = "cn";
            variant = "";
        };
    };

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
}
