# nix-ld: run pre-compiled binaries on NixOS
{ config, pkgs, ... }:

{
    programs.nix-ld.enable = true;
}
