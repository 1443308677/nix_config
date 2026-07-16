{ config, pkgs, ... }:

{
    programs.niri.monitorConfigFile = ./monitor.kdl;
}
