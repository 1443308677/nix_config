# Niri user configuration: keybindings, monitor layout (per-host), GTK theme
{ config, pkgs, lib, ... }:

let
    cfg = config.programs.niri;
in {
    imports = [
        ./gtk.nix
    ];

    options.programs.niri.monitorConfigFile = lib.mkOption {
        type = lib.types.path;
        default = ./conf.d/monitor.kdl;
        description = "Per-host niri monitor configuration file";
    };

    config = {
        # 主入口
        xdg.configFile."niri/config.kdl" = {
            force = true;
            source = ./conf.d/config.kdl;
        };

        # 子配置目录
        xdg.configFile."niri/conf.d" = {
            force = true;
            source = pkgs.runCommand "niri-conf-d" {
                src = ./conf.d;
                monitorConfig = cfg.monitorConfigFile;
            } ''
                mkdir -p "$out"
                cp -r "$src"/* "$out/"
                cp -f "$monitorConfig" "$out/monitor.kdl"
            '';
        };
    };
}
