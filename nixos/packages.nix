{ config, pkgs, inputs, ... }:
let 
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};

    unstablePackages = with unstable; [
    amneziawg-tools
    #wireguard-tools
    freecad
    # Другие пакеты
    # linuxKernel.packages.linux_6_6.amneziawg
    # byedpi
    # spoofdpi
    # amneziawg-go
  ];
in {
    environment.systemPackages = with pkgs; [
     #  cli-things
     btop
     #oh-my-posh
     fastfetch
     bat  
     nerdfonts
     corefonts
     yazi
     zoxide

     #  codding
     gcc
     python3 
     jetbrains.idea-community
     jdk21_headless
     jdk17_headless
     neovim
     valgrind
     git
     gnumake

     # video-games
     mangohud
     prismlauncher
     bottles
     
     #  gnomeExtensions
     

     # base progrmas

     #firefox
     firefox
     librewolf
     libreoffice
     hunspellDicts.ru_RU    
     mpv
     gparted

     # social
     discord
     telegram-desktop

    # others

     obs-studio
     clipman
     xclip
     safeeyes   
     obsidian
     sshuttle
     localsend
     p7zip
     shotcut
     keepassxc
     qbittorrent
     #nwg-look

     home-manager

  ] ++ unstablePackages;
}
