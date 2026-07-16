# Home Manager shared configuration: imported by both vmware and laptop
{ config, userName, homeDirectory, ... }:

{
    imports = [
        ./shell
        ./niri
        ./noctalia
    ];

    # 用户信息
    home.username = userName;
    home.homeDirectory = homeDirectory;

    # Home Manager 版本
    home.stateVersion = "26.05";

    programs.home-manager.enable = true;

    # 夜览切换脚本（Mod+F4）
    home.file.".local/bin/nightlight-toggle" = {
        executable = true;
        source = ./scripts/nightlight-toggle.sh;
    };
}
