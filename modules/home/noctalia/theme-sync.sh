#!/bin/bash

# ===== 第 1 步：获取当前主题模式（深色还是浅色） =====
# 先从环境变量获取，如果没有就从 Noctalia 查询，还查不到就默认 dark
THEME_MODE="${NOCTALIA_THEME_MODE}"
if [ -z "$THEME_MODE" ]; then
    THEME_MODE=$(noctalia msg theme-mode-get 2>/dev/null || echo "dark")
fi

echo "正在同步主题模式为: $THEME_MODE"

# ===== 工具函数：安全地修改 INI 配置文件 =====
# 如果文件不存在就跳过；如果已有该配置项则替换值，否则追加到 [Settings] 后面
update_ini() {
    local file="$1"   # 要修改的文件路径
    local key="$2"    # 配置项名称
    local val="$3"    # 要设置的值
    
    if [ ! -f "$file" ]; then
        return  # 文件不存在就不管
    fi
    
    if grep -q "^${key}=" "$file"; then
        # 已有该项 → 直接替换值
        sed -i "s|^${key}=.*|${key}=${val}|" "$file"
    else
        # 没有该项 → 在 [Settings] 后面追加一行
        if grep -q "^\[Settings\]" "$file"; then
            sed -i "/^\[Settings\]/a ${key}=${val}" "$file"
        else
            echo "${key}=${val}" >> "$file"
        fi
    fi
}

# ===== 第 2 步：根据深色/浅色模式，同步给其他应用 =====
if [ "$THEME_MODE" = "light" ]; then
    # ——— 浅色模式 ———
    
    # ① 告诉系统级的 GTK 设置（影响 Firefox、Chromium、VS Code 等）
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
    
    # ② 修改 GTK3 配置（影响 GTK3 程序）
    update_ini "$HOME/.config/gtk-3.0/settings.ini" "gtk-application-prefer-dark-theme" "false"
    update_ini "$HOME/.config/gtk-3.0/settings.ini" "gtk-theme-name" "adw-gtk3"
    
    # ③ 修改 GTK4 配置（影响 GTK4 程序）
    update_ini "$HOME/.config/gtk-4.0/settings.ini" "gtk-application-prefer-dark-theme" "false"
else
    # ——— 深色模式 ———
    
    # ① 告诉系统级的 GTK 设置
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
    
    # ② 修改 GTK3 配置
    update_ini "$HOME/.config/gtk-3.0/settings.ini" "gtk-application-prefer-dark-theme" "true"
    update_ini "$HOME/.config/gtk-3.0/settings.ini" "gtk-theme-name" "adw-gtk3-dark"
    
    # ③ 修改 GTK4 配置
    update_ini "$HOME/.config/gtk-4.0/settings.ini" "gtk-application-prefer-dark-theme" "true"
fi
