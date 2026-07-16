# XDG Desktop Portal:桌面门户与文件选择器后端
{ config, pkgs, ... }:

{
    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-gnome
        ];
        configPackages = [ pkgs.niri ];
    };
}
