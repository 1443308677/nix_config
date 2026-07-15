{ config, pkgs, ... }:

{
    programs.noctalia.enable = true;

    nix.settings = {
        extra-substituters = [ "https://noctalia.cachix.org" ];
        extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
    };

    fonts.packages = with pkgs; [
        jetbrains-mono
        noto-fonts-cjk-sans
    ];
}
