{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;
    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        access-tokens = [ "github.com=${builtins.readFile ./../../../secrets/github-access-token}" ];
        substituters = [
            "https://niri.cachix.org"
            "https://noctalia.cachix.org"
            "https://nix-community.cachix.org"
            "https://cache.nixos.org"
        ];
        trusted-public-keys = [
            "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
            "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        ];
    };

    system.stateVersion = "26.05";
}
