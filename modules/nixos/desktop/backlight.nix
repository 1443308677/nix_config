# 背光权限:允许 video 组用户调节屏幕亮度
{ config, pkgs, ... }:

{
    services.udev.extraRules = ''
        SUBSYSTEM=="backlight", ACTION=="add", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/%k/brightness", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/backlight/%k/brightness"
    '';
}
