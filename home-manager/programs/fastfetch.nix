{ config, pkgs, ... } :

{
    programs.fastfetch = {
        enable = true;
        settings = {
            logo.source = "nixos_small";
            modules = [
                "title"
                "separator"
                "os"
                "cpu"
                "gpu"
                "disk"
                "break"
            ];
        };
    };

    home.packages = with pkgs; [
        pciutils
    ];
}
