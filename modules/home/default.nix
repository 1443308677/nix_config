{ config, ... }:

{
    imports = [
        ./shell
        ./niri
        ./noctalia
        ./rust
    ];

    # 用户信息
    home.username = "jun";
    home.homeDirectory = "/home/jun";

    # Home Manager 版本
    home.stateVersion = "26.05";

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
