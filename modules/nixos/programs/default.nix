# User-facing applications
{ config, pkgs, ... }:

{
    environment.systemPackages = [ pkgs.brave ];
    environment.sessionVariables.DEFAULT_BROWSER = "${pkgs.brave}/bin/brave";
}
