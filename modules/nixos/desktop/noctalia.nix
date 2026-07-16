# Noctalia desktop shell and font packages
{ config, pkgs, ... }:

{
    programs.noctalia.enable = true;

    fonts.packages = with pkgs; [
        jetbrains-mono
        noto-fonts-cjk-sans
    ];
}
