{ config, ... }:

{
    xdg.configFile."noctalia/config.toml" = {
        force = true;
        source = ./config.toml;
    };

    xdg.configFile."noctalia/conf.d" = {
        force = true;
        source = ./conf.d;
        recursive = true;
    };

    xdg.configFile."noctalia/theme-sync.sh" = {
        force = true;
        source = ./theme-sync.sh;
        executable = true;
    };

    home.file.".local/state/noctalia/settings.toml" = {
        force = true;
        text = "";
    };
}
