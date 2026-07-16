{ pkgs, ... }:

{
    gtk = {
        enable = true;
        theme = {
            name = "Catppuccin-Mocha-Standard-Blue-Dark";
            package = pkgs.catppuccin-gtk.override {
                accents = [ "blue" ];
                size = "standard";
                variant = "mocha";
            };
        };
        gtk3.extraConfig."gtk-application-prefer-dark-theme" = 1;
    };
}
