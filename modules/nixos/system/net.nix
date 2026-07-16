# Network configuration: hostname, NetworkManager, DNS, SSH
{ config, pkgs, lib, hostName, ... }:

{
    networking = {
        inherit hostName;
        networkmanager.enable = true;
        nameservers = [ "192.168.2.2" "1.1.1.1" ];

        networkmanager.dispatcherScripts = [{
            source = pkgs.writeText "set-gateway" ''
                #!/bin/sh
                if [ "$2" = "up" ]; then
                    ${lib.getBin pkgs.iproute2}/bin/ip route replace default via 192.168.2.2
                fi
            '';
            type = "basic";
        }];
    };

    services.openssh.enable = true;
}
