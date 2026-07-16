# NixOS shared modules: imported by both vmware and laptop
{ config, pkgs, ... }:

{
    imports = [
        ./system   # 系统层：时区、网络、Nix 配置
        ./desktop  # 桌面层：音频、合成器、打印
        ./programs # 应用层：浏览器等
        ./users    # 用户账户
    ];
}
