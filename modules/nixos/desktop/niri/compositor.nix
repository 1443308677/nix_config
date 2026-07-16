# Niri compositor, greetd login, fcitx5 input method, and desktop environment packages
{ config, pkgs, userName, ... }:

{
    programs.niri = {
        enable = true;
    };

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${config.programs.niri.package}/bin/niri-session";
                user = userName;
            };
        };
    };

    security.polkit.enable = true;

    services.udev.extraRules = ''
        SUBSYSTEM=="backlight", ACTION=="add", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/%k/brightness", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/backlight/%k/brightness"
    '';

    services.udisks2.enable = true;

    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-gnome
        ];
        configPackages = [ pkgs.niri ];
    };

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;

    i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5.addons = with pkgs; [ qt6Packages.fcitx5-chinese-addons ];
    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
    };

    environment.systemPackages = with pkgs; [
        alacritty
        thunar
        thunar-volman
        thunar-archive-plugin
        xwayland-satellite
        brightnessctl
        wlsunset
        swaylock
    ];

    services.gvfs.enable = true;
}
