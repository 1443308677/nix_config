#!/usr/bin/env bash
# 夜览模式切换:有 wlsunset 进程则关闭,无则启动
if pgrep wlsunset >/dev/null 2>&1; then
    pkill wlsunset
else
    wlsunset -t 4000 -T 10000 &
    disown
fi
