{ config, pkgs, ... }:

{
    imports = [
        ./pipewire.nix        # 音频
        ./printing.nix        # 打印服务
        ./niri/compositor.nix # 窗口合成器 + 输入法
        ./niri/noctalia.nix   # 桌面 shell + 字体
    ];
}
