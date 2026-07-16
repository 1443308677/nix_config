# Niri greetd 登录管理器与桌面服务
{ config, pkgs, userName, ... }:

{
    # ==================== Greetd 登录管理器 ====================
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${config.programs.niri.package}/bin/niri-session";
                user = userName;
            };
        };
    };

    # ==================== 系统服务 ====================
    security.polkit.enable = true;

    services.udisks2.enable = true;

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;

    services.gvfs.enable = true;

    # ==================== 环境变量 ====================
    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
    };

    # ==================== 系统包 ====================
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
}
