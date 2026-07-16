# 输入法:fcitx5 中文输入引擎
{ config, pkgs, ... }:

{
    i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5.addons = with pkgs; [ qt6Packages.fcitx5-chinese-addons ];
    };
}
