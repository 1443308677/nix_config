{ pkgs, ... }:

{
    # GTK 暗色主题（Thunar 等 GTK3 应用）
    gtk = {
        enable = true;
        theme = {
            name = "Adwaita-dark";
            package = pkgs.gnome-themes-extra;
        };
        gtk3.extraConfig."gtk-application-prefer-dark-theme" = 1;
    };
}
