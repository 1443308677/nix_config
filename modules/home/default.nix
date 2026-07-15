{ config, ... }:

{
    imports = [
        ./shell
        ./niri
        ./noctalia
    ];

    # 用户信息
    home.username = "jun";
    home.homeDirectory = "/home/jun";

    # Home Manager 版本，用于兼容性检查，不要随意更改
    home.stateVersion = "26.05";

    # 启用 Home Manager 自身管理
    programs.home-manager.enable = true;

    # 夜览切换脚本（Mod+F4）
    home.file.".local/bin/nightlight-toggle" = {
        executable = true;
        text = ''
            #!/usr/bin/env bash
            if pgrep wlsunset >/dev/null 2>&1; then
                pkill wlsunset
            else
                wlsunset -t 4000 -T 10000 &
                disown
            fi
        '';
    };
}
