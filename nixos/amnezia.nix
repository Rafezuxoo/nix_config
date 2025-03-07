{ config, pkgs, inputs, ... }: 
{
    networking.wg-quick.interfaces.wg0 = {
        autostart = true;
        type = "amneziawg";
        configFile = "~/NixConfig/nixos/WARP14.conf";
    };
}
