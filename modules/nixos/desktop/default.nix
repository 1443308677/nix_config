# Desktop module imports: audio, compositor, printing, portal, input method
{ config, pkgs, ... }:

{
    imports = [
        ./pipewire.nix          # 音频
        ./printing.nix          # 打印服务
        ./niri/niri.nix         # Niri 合成器启用
        ./niri/compositor.nix   # greetd 登录 + 桌面服务
        ./backlight.nix         # 背光权限
        ./portal.nix            # XDG Desktop Portal
        ./input-method.nix      # fcitx5 中文输入法
        ./noctalia.nix          # 桌面 Shell + 字体
    ];
}
