{ config, pkgs, ... }:

{
    services.xserver = {
        enable = true;
        xkb = {
            layout = "us";
            variant = "";
        };
    };

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    i18n.inputMethod = {
        type = "ibus";
        enable = true;
        ibus.engines = with pkgs.ibus-engines; [ libpinyin ];
    };
}
