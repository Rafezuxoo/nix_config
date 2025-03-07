{config, pkgs, ...}:
let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
in {
  environment.systemPackages = with pkgs; [
    #unstable.linuxKernel.packages.linux_6_6.amneziawg 
    unstable.amneziawg-tools
    unstable.freecad
    

    #unstable.byedpi
    #unstable.spoofdpi
    #unstable.amneziawg-go
  ];
}
