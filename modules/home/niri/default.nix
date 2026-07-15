{ config, pkgs, ... }: {
    imports = [
        ./gtk.nix
    ];

    # 主入口配置文件
    xdg.configFile."niri/config.kdl" = {
        force = true;
        source = ./conf.d/config.kdl;
    };

    # 子配置目录（不含 config.kdl 本身）
    xdg.configFile."niri/conf.d" = {
        force = true;
        source = pkgs.runCommand "niri-conf-d" { } ''
            mkdir -p $out
            cp ${./conf.d}/monitor.kdl $out/
            cp ${./conf.d}/input.kdl $out/
            cp ${./conf.d}/layout.kdl $out/
            cp ${./conf.d}/window-system.kdl $out/
            cp ${./conf.d}/desktop.kdl $out/
            cp ${./conf.d}/env.kdl $out/
            cp ${./conf.d}/animation.kdl $out/
            cp ${./conf.d}/window-apps.kdl $out/
            cp ${./conf.d}/binds.kdl $out/
            cp ${./conf.d}/recent-windows.kdl $out/
        '';
    };
}
