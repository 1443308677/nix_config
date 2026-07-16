# System-level configuration
{ config, pkgs, ... }:

{
    imports = [
        ./local.nix         # 时区、语言区域
        ./net.nix           # 网络
        ./nix-ld.nix        # 预编译二进制兼容
        ./nix-settings.nix  # Nix 自身配置（unfree、flakes、cachix）
    ];
}
